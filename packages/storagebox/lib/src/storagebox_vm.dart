/*
 * Copyright (c) 2020-present Invertase Limited & Contributors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this library except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import 'dart:convert' as convert;
import 'dart:io' as io;

import 'package:meta/meta.dart' as meta;
import 'package:path/path.dart' as path;
import 'package:xdg_directories/xdg_directories.dart' as xdg;

import 'exception.dart';
import 'storagebox_base.dart';

class StorageBoxImplementation<K, T>
    extends StorageBoxImplementationBase<K, T> {
  StorageBoxImplementation(
    String id, {
    Map<K, T>? defaults,
    required String configPathPrefix,
  }) : super(
          id,
          defaults: defaults,
        ) {
    final pathSuffix = path.joinAll([configPathPrefix, '$id.json']);
    if (io.Platform.isWindows) {
      final homeDir = io.Platform.environment['HOME'] ??
          io.Platform.environment['USERPROFILE'];
      file = io.File(
        path.joinAll([homeDir!, '.config', configPathPrefix, '$id.json']),
      );
    } else {
      file = io.File(path.joinAll([xdg.configHome.path, pathSuffix]));
    }
  }

  @meta.visibleForTesting
  late io.File file;

  @meta.visibleForTesting
  @override
  Map<K, T> get delegate {
    try {
      final fileContents = file.readAsStringSync();
      final configMap =
          const convert.JsonDecoder().convert(fileContents) as Map;
      return {
        ...defaults,
        ...Map<K, T>.from(configMap),
      };
    } on io.FileSystemException catch (exception) {
      // ENOENT - file or directory does not exist.
      // We don't create until a value is set.
      if (exception.osError?.errorCode == 2 ||
          exception.osError?.errorCode == 3) {
        return {
          ...defaults,
        };
      }

      // EACCES - no permission to access the file.
      // Throw a nicer error message.
      if (exception.osError?.errorCode == 13) {
        throw Exception(
          'Access denied when attempting to read the "$id" storagebox at path "${file.path}".',
        );
      }

      rethrow;
    } on FormatException {
      // The file is empty or contains invalid JSON.
      // Next time the map is modified the file will be reset.
      return {
        ...defaults,
      };
    } catch (e) {
      rethrow;
    }
  }

  @meta.visibleForTesting
  @override
  set delegate(Map<K, T> updatedMap) {
    try {
      final updatedConfigMapString =
          const convert.JsonEncoder.withIndent('\t').convert(updatedMap);
      file.createSync(recursive: true);
      file.writeAsStringSync(
        updatedConfigMapString,
        flush: true,
      );
      return;
    } on io.FileSystemException catch (exception) {
      // EACCES - no permission to access the file.
      // Throw a helpful error message.
      if (exception.osError?.errorCode == 13) {
        throw StorageBoxException(
          'Access denied when attempting to write to the "$id" storagebox at path "${file.path}".',
        );
      }
      rethrow;
      // ignore: avoid_catching_errors
    } on convert.JsonUnsupportedObjectError catch (error) {
      final key = updatedMap.keys
          .firstWhere((key) => updatedMap[key] == error.unsupportedObject);
      throw StorageBoxException(
        'Value for key "$key" for "$id" storagebox at path "${file.path}" is not a JSON serializable value.',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool operator ==(Object other) {
    return other is StorageBoxImplementation && other.file.path == file.path;
  }

  @override
  int get hashCode => file.path.hashCode;
}
