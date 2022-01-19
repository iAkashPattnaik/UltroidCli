// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'dart:io';

import 'package:colorx/colorx.dart';

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
      "[ ${'root://sessionGen [.exe]'.brightMagenta} ] does not exists.\n"
      "Run [ ${'ultroid init'.brightGreen} ] first to install the required dependencies."
    );
    exit(1);
  }
}