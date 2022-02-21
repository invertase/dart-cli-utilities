<p align="center">
  <h1>🌈 AnsiStyles</h1>
  <span>Create colorful terminal output with ansi styled text in io environments.</span>
</p>

<a href="https://github.com/invertase/melos"><img src="https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square" alt="Melos" /></a>
<a href="https://docs.page"><img src="https://img.shields.io/badge/powered%20by-docs.page-34C4AC.svg?style=flat-square" alt="docs.page" /></a>

<a href="https://dart-cli-utilities.invertase.dev">Documentation</a> &bull;
<a href="https://github.com/invertase/dart-cli-utilities/blob/main/LICENSE">License</a>

---

## Usage

Import the package:

```dart
import 'package:ansi_styles/ansi_styles.dart';
```

Use the `AnsiStyle` export to create styled text by chaining properties. For example:

```dart
void main() {
  print(AnsiStyles.red.underline('Underlined red text'));
  print(AnsiStyles.inverse.italic.green('Inverted italic green text'));
  print(AnsiStyles.cyan('Cyan text'));
  print(AnsiStyles.bgYellowBright.bold('Bold text with a yellow background'));
  print(AnsiStyles.bold.rgb(255,192,203)('Bold pink text'));
  print(AnsiStyles.strikethrough.bgRgb(255,165,0)('Strikethrough text with an orange background'));
}
```

**Output preview**:

![ansi_styles_preview](https://static.invertase.io/assets/ansi_styles_example.png)

To remove any ansi styling from text, call the `strip()` method:

```dart
String styledText = AnsiStyles.red.underline('Underlined red text');
String cleanText = AnsiStyles.strip(styledText);
```

### String Extension

This package also provides a String Extension which can be imported:

```dart
import 'package:ansi_styles/extension.dart';
```

Styling methods are now available on Strings:

```dart
void main() {
  print('hello'.bold.red);
  print('hello'.bold.red.underline.bgBlack);
}
```

## License

- See [LICENSE](/LICENSE)

---

<p align="center">
  <a href="https://invertase.io/?utm_source=readme&utm_medium=footer&utm_campaign=dart-cli-utilities">
    <img width="75px" src="https://static.invertase.io/assets/invertase/invertase-rounded-avatar.png">
  </a>
  <p align="center">
    Built and maintained by <a href="https://invertase.io/?utm_source=readme&utm_medium=footer&utm_campaign=dart-cli-utilities">Invertase</a>.
  </p>
</p>
