// ignore_for_file: avoid_print

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

import 'package:storagebox/storagebox.dart';

Future<void> main() async {
  final config = StorageBox('my_awesome_cli');
  config['foo'] = 'bar';
  print(config['foo']);
  config['bar'] = 'foo';
  print(config['bar']);

  // Config is a Map so Map methods can be used;
  config.forEach((key, value) {
    print('$key : $value');
  });
  print(config.containsKey('foo'));
  print(config.remove('bar'));

  // Unserializable JSON values are detected and a StorageBoxException thrown.
  config['error'] = const Duration(milliseconds: 500);
}
