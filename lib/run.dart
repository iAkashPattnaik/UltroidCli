// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorize/colorize.dart';
import 'dart:io';

void runUltroid() async {
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      "[ ${Colorize('root://TeamUltroid').lightMagenta()} ] does not exists.\n"
      "Run [ ${Colorize('ultroid init').lightGreen()} ] first to install the repository and dependencies."
    );
    exit(1);
  }
  if (!File('./TeamUltroid/.env').existsSync()) {
    print(
      Colorize("Please create the file [ ${Colorize('root://TeamUltroid/.env').lightMagenta()} ]")
    );
    exit(1);
  }
  await Process.start(
    'python', ['-m', 'pyUltroid'],
    runInShell: true,
    workingDirectory: rootDirectory.absolute.uri.toFilePath(),
    mode: ProcessStartMode.inheritStdio,
  );
}
