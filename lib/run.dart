// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';
import 'dart:io';

void runUltroid() async {
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      "[ ${'root://TeamUltroid'.brightMagenta} ] does not exists.\n"
      "Run [ ${'ultroid init'.brightMagenta} ] first to install the repository and dependencies."
    );
    exit(1);
  }
  if (!File('./TeamUltroid/.env').existsSync()) {
    print("Please create the file [ ${'root://TeamUltroid/.env'.brightMagenta} ]");
    exit(1);
  }
  await Process.start(
    'python',
    ['-m', 'pyUltroid'],
    runInShell: true,
    workingDirectory: rootDirectory.absolute.uri.toFilePath(),
    mode: ProcessStartMode.inheritStdio,
  );
}
