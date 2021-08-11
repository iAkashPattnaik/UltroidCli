// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorize/colorize.dart';
import 'dart:io';

void version() async {
  var dartVersion = '';
  var pythonVersion = '';
  var pipVersion = '';
  var dartVersionProcess = await Process.run('dart', ['--version'], runInShell: true);
  var pythonVersionProcess = await Process.run('python', ['-V'], runInShell: true);
  var pipVersionProcess = await Process.run('pip', ['-V', '--no-input'], runInShell: true);
  if (dartVersionProcess.stderr != null && dartVersionProcess.exitCode == 0) {
    // Dart prints the version to stderr
    dartVersion = dartVersionProcess.stderr.toString().split(' ')[3];
  } else {
    dartVersion = '';
  }
  if (pythonVersionProcess.stderr != null && pythonVersionProcess.stdout != null) {
    pythonVersion = pythonVersionProcess.stdout.toString().split(' ')[1];
  } else {
    pythonVersion = '';
  }
  if (pipVersionProcess.stderr != null && pipVersionProcess.stdout != null) {
    pipVersion = pipVersionProcess.stdout.toString().split(' ')[1];
  } else {
    pipVersion = '';
  }
  print(
    "Dart version • ${dartVersion != '' ? Colorize(dartVersion).cyan() : Colorize('Dart Not Installed').red()}\n"
    "Python version • ${pythonVersion != '' ? Colorize(pythonVersion).cyan() : Colorize('Python Not Installed').red()}"
    "Pip version • ${pipVersion != '' ? Colorize(pipVersion).cyan() : Colorize('Pip Not Installed').red()}\n"
    'Platform • ${Colorize(Platform.operatingSystem).cyan()}\n'
    '\n'
    "This Project is opensource and is maintained by Akash Pattnaik [ ${Colorize('github.com/BLUE-DEVIL1134').lightMagenta()} ]\n"
    "THe Source code can be found at • [ ${Colorize('github.com/BLUE-DEVIL1134/UltroidCli').lightMagenta()} ]"
  );
  print(
    pythonVersion != '' ?
    "You are ${Colorize('good to run').lightGreen()} Ultroid" :
    "Please ${Colorize('Install').lightGreen()} ${Colorize('Python 3.9.5+').red()} To Use ${Colorize('Ultroid').lightMagenta()}"
  );
}