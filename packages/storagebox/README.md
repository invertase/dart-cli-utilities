<p align="center">
  <h1>📦 StorageBox</h1>
  <span>Easily store and persist configuration items for your Dart CLIs and Web apps.</span>
</p>

<a href="https://github.com/invertase/melos"><img src="https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square" alt="Melos" /></a>
<a href="https://docs.page"><img src="https://img.shields.io/badge/powered%20by-docs.page-34C4AC.svg?style=flat-square" alt="docs.page" /></a>

<a href="https://dart-cli-utilities.invertase.dev">Documentation</a> &bull;
<a href="https://github.com/invertase/dart-cli-utilities/blob/main/LICENSE">License</a>

---

### About

Storagebox is a lightweight configuration storage API for Dart CLI apps with a familiar `Map`-like API.

It maintains some compatibility with [`configstore`](https://github.com/yeoman/configstore) from the Node.js ecosystem via `configPathPrefix`, allowing you to migrate away from it or use existing configuration items that exist from Node.js based CLIs.

**Example:**

```dart
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
}
```

---

<p align="center">
  <a href="https://invertase.io/?utm_source=readme&utm_medium=footer&utm_campaign=dart-cli-utilities">
    <img width="75px" src="https://static.invertase.io/assets/invertase/invertase-rounded-avatar.png">
  </a>
  <p align="center">
    Built and maintained by <a href="https://invertase.io/?utm_source=readme&utm_medium=footer&utm_campaign=dart-cli-utilities">Invertase</a>.
  </p>
</p>
