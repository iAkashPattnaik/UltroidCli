import 'dart:io';
import 'package:colorize/colorize.dart';

void main(List<String> args) async {
  if (!Platform.isWindows) {
    print(Colorize('This script is only for Windows.').lightRed());
    exit(1);
  }
  print("Building sessionGen Executable [ ${Colorize('Python').lightGreen()} ] [ ${Colorize('Windows').cyan()} ]");
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
  print("Built sessionGen Executable [ ${Colorize('Python').cyan()} ] ✔️");
  print("Building ultroid_cli Executable [ ${Colorize('Dart').lightGreen()} ] [ ${Colorize('Windows').cyan()} ]");
  Process.runSync('dart',
    ['compile', 'exe', 'bin\\ultroid_cli.dart', '-DDEBUG=false', '-o', 'build/ultroid.exe'],
    runInShell: true,
    workingDirectory: Directory('.').absolute.uri.toFilePath()
  );
  print("Built ultroid_cli Executable [ ${Colorize('Dart').cyan()} ] ✔️");
}
