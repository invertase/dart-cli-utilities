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

import 'dart:io';

import 'package:ci/ci.dart' as ci;
import 'package:test/test.dart';

void main() {
  group(
    'test on github actions',
    () {
      test('[isCI] returns true if running on GH actions', () {
        expect(ci.isCI, isTrue);
      });

      test('generated vendor flags correctly return true/false', () {
        expect(ci.Vendor.IS_GITHUB_ACTIONS, isTrue);
        expect(ci.Vendor.IS_CIRRUS, isFalse);
      });

      test('generated current vendor should return GitHub', () {
        expect(ci.currentVendor, isNotNull);
        expect(ci.Vendor.current, isNotNull);
        expect(ci.currentVendor?.name, equals('GitHub Actions'));
      });
    },
    skip: !Platform.environment.containsKey('GITHUB_ACTIONS'),
  );
}
