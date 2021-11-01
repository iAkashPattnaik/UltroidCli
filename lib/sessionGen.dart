// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'dart:io';

import 'package:colorize/colorize.dart';

void generateSession() async {
  final sessionGenAppWin = File('./sessionGen.exe');
  final sessionGenAppLinux = File('./sessionGen.exe');
  if (sessionGenAppWin.existsSync()) {
    await Process.start(
      'sessionGen.exe', [],
      runInShell: true,
      workingDirectory: Directory('.').absolute.uri.toFilePath(),
      mode: ProcessStartMode.inheritStdio,
    );
  } else if (sessionGenAppLinux.existsSync()) {
    await Process.start(
      './sessionGen', [],
      runInShell: true,
      workingDirectory: Directory('.').absolute.uri.toFilePath(),
      mode: ProcessStartMode.inheritStdio,
    );
  } else { 
    print(
      "[ ${Colorize('root://sessionGen [.exe]').lightMagenta()} ] does not exists.\n"
      "Run [ ${Colorize('ultroid init').lightGreen()} ] first to install the required dependencies."
    );
    exit(1);
  }
}