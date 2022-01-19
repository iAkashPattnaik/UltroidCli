// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'dart:io';
import 'package:colorx/colorx.dart';

void main(List<String> args) async {
  if (!Platform.isWindows) {
    print('This script is only for Windows.'.brightRed);
    exit(1);
  }
  print("Building sessionGen Executable [ ${'Python'.brightGreen} ] [ ${'Windows'.cyan} ]");
  if (Directory('./src/build').existsSync()) {
    Directory('./src/build').deleteSync(recursive: true);
  }
  if (Directory('./src/dist').existsSync()) {
    Directory('./src/dist').deleteSync(recursive: true);
  }
  Process.runSync('pyinstaller',
    ['-F', '-n', 'sessionGen', '-c', '-i', '..\\icon.ico', 'session-gen.py'],
    runInShell: true,
    workingDirectory: Directory('./src/').absolute.uri.toFilePath(),
  );
  Process.runSync('cmd',
    ['/c', 'copy', 'dist\\sessionGen.exe', '..\\build\\sessionGen.exe'],
    runInShell: true,
    workingDirectory: Directory('./src/').absolute.uri.toFilePath()
  );
  print("Built sessionGen Executable [ ${'Python'.cyan} ] ✔️");
  print("Building ultroid_cli Executable [ ${'Dart'.brightGreen} ] [ ${'Windows'.cyan} ]");
  Process.runSync('dart',
    ['compile', 'exe', 'bin\\ultroid_cli.dart', '-DDEBUG=false', '-o', 'build/ultroid.exe'],
    runInShell: true,
    workingDirectory: Directory('.').absolute.uri.toFilePath()
  );
  print("Built ultroid_cli Executable [ ${'Dart'.cyan} ] ✔️");
}
