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

import 'vendor.g.dart';

/// Whether the current process is running in a CI environment.
bool get isCI {
  return Platform.environment.containsKey('CI') ||
      Platform.environment.containsKey('CONTINUOUS_INTEGRATION') ||
      Platform.environment.containsKey('BUILD_NUMBER') ||
      Vendor.current != null;
}

/// Whether the current process is running in a CI and is for a Pull Request.
bool get isPullRequest {
  return Vendor.current?.isPullRequest ?? false;
}

/// The current CI [Vendor] or null if no CI vendor detected (e.g. not running on CI).
Vendor? get currentVendor {
  return Vendor.current;
}
