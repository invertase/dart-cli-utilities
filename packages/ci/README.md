<p align="center">
  <h1>☁️ CI</h1>
  <span>Detect whether you're running in a CI environment and retrieve information about the CI vendor.</span>
</p>

<a href="https://github.com/invertase/melos"><img src="https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square" alt="Melos" /></a>
<a href="https://docs.page"><img src="https://img.shields.io/badge/powered%20by-docs.page-34C4AC.svg?style=flat-square" alt="docs.page" /></a>

<a href="https://dart-cli-utilities.invertase.dev">Documentation</a> &bull;
<a href="https://github.com/invertase/dart-cli-utilities/blob/main/LICENSE">License</a>

---

### About

**Example:**

```dart
import 'package:ci/ci.dart' as ci;

Future<void> main() async {
  print(ci.isCI);
  print(ci.isPullRequest);
  print(ci.currentVendor);
  print(ci.currentVendor?.name);
  print(ci.currentVendor?.isPullRequest);
  print(ci.Vendor.IS_GITHUB_ACTIONS);
}
```

#### Adding support for a new CI vendor

The default CI vendors list is sourced from [watson/ci-info](https://github.com/watson/ci-info/blob/master/vendors.json), with an additional local [`vendors.json`](tools/vendors.json) file that allows adding new vendors or overriding vendors from the default CI vendors list.

In most cases, you should make changes to the local [`vendors.json`](tools/vendors.json) file and send a PR to add in support. Run `dart generator/generate_vendors.dart` before submitting your PR to update the generated `vendor.g.dart` file.

---

<p align="center">
  <a href="https://invertase.io/?utm_source=readme&utm_medium=footer&utm_campaign=dart-cli-utilities">
    <img width="75px" src="https://static.invertase.io/assets/invertase/invertase-rounded-avatar.png">
  </a>
  <p align="center">
    Built and maintained by <a href="https://invertase.io/?utm_source=readme&utm_medium=footer&utm_campaign=dart-cli-utilities">Invertase</a>.
  </p>
</p>
