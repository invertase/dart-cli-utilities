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
import 'dart:html' as html;

import 'package:meta/meta.dart' as meta;

import 'exception.dart';
import 'storagebox_base.dart';

class StorageBoxImplementation<K, T>
    extends StorageBoxImplementationBase<K, T> {
  StorageBoxImplementation(
    String id, {
    Map<K, T>? defaults,
    required String configPathPrefix,
  }) : super(id, defaults: defaults) {
    storageKey = '.$configPathPrefix/$id';
  }

  @meta.visibleForTesting
  late String storageKey;

  @meta.visibleForTesting
  @override
  Map<K, T> get delegate {
    try {
      final contents = html.window.localStorage[storageKey];
      final configMap =
          const convert.JsonDecoder().convert(contents ?? '{}') as Map;
      return {
        ...defaults,
        ...Map<K, T>.from(configMap),
      };
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
      html.window.localStorage[storageKey] = updatedConfigMapString;
      return;
      // ignore: avoid_catching_errors
    } on convert.JsonUnsupportedObjectError catch (error) {
      final key = updatedMap.keys
          .firstWhere((key) => updatedMap[key] == error.unsupportedObject);
      throw StorageBoxException(
        'Value for key "$key" for "$id" storagebox is not a JSON serializable value.',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool operator ==(Object other) {
    return other is StorageBoxImplementation && other.storageKey == storageKey;
  }

  @override
  int get hashCode => storageKey.hashCode;
}
