// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';
import 'dart:io';

void version() async {
  var dartVersion = '';
  var pythonVersion = '';
  var pipVersion = '';
  var dartVersionProcess = await Process.run('dart', ['--version'], runInShell: true);
  var pythonVersionProcess = await Process.run('python', ['-V'], runInShell: true);
  var pipVersionProcess = await Process.run('pip', ['-V', '--no-input'], runInShell: true);
  if (dartVersionProcess.stderr != null && dartVersionProcess.exitCode == 0) {
    try {
      // Dart prints the version to stderr, (happened to me on windows) !
      dartVersion = dartVersionProcess.stderr.toString().split(' ')[3];
    } catch (error) {
      dartVersion = dartVersionProcess.stdout.toString().split(' ')[3];
    }
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
    "Dart version • ${dartVersion != '' ? dartVersion.cyan : 'Dart Not Installed'.red}\n"
    "Python version • ${pythonVersion != '' ? pythonVersion.cyan : 'Python Not Installed'.red}"
    "Pip version • ${pipVersion != '' ? pipVersion.cyan : 'Pip Not Installed'.red}\n"
    "UltroidCli version • ${'1.0.7'.cyan}\n"
    'Platform • ${Platform.operatingSystem.cyan}\n'
    '\n'
    "This Project is opensource and is maintained by Akash Pattnaik [ ${'github.com/BLUE-DEVIL1134'.brightMagenta} ]\n"
    "The Source code can be found at • [ ${'github.com/BLUE-DEVIL1134/UltroidCli'.brightMagenta} ]"
  );
  print(
    pythonVersion != '' ?
    "You are ${'good to run'.brightGreen} Ultroid" :
    "Please ${'Install'.brightGreen} ${'Python 3.9.7+'.red} To Use ${'Ultroid'.brightMagenta}"
  );
}
