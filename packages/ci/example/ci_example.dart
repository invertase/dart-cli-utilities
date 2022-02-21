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

import 'package:ci/ci.dart' as ci;

Future<void> main() async {
  print(ci.isCI);
  print(ci.isPullRequest);
  print(ci.currentVendor);
  print(ci.currentVendor?.name);
  print(ci.currentVendor?.isPullRequest);
  print(ci.Vendor.IS_GITHUB_ACTIONS);
}
