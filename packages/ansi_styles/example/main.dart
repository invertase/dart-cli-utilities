// ignore_for_file: avoid_print
import 'package:ansi_styles/ansi_styles.dart';
import 'package:ansi_styles/extension.dart';

void main() {
  print(AnsiStyles.red.underline('Underlined red text'));
  print(AnsiStyles.inverse.italic.green('Inverted italic green text'));
  print(AnsiStyles.cyan('Cyan text'));
  print(AnsiStyles.bgYellowBright.bold('Bold text with a yellow background'));
  print(AnsiStyles.bold.rgb(255, 192, 203)('Bold pink text'));
  print(
    AnsiStyles.strikethrough
        .bgRgb(255, 165, 0)('Strikethrough text with an orange background'),
  );
  // Using string extension
  print('hello'.bold.red);
  print('hello'.bold.red.underline.bgBlack);
}
