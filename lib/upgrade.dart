// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';
import 'dart:io';

// Ultroid
import 'package:ultroid_cli/version.dart';

void upgradeUltroid() async {
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      "[ ${'root://TeamUltroid'.brightMagenta} ] does not exists.\n"
      "Run [ ${'ultroid init'.brightGreen} ] first to install the repository and dependencies."
    );
    exit(1);
  }
  await rootDirectory.delete(recursive: true);
  print('Installing an upgraded version of Ultroid to [ '.cyan + 'root://TeamUltroid'.brightMagenta + ' ]'.cyan);
  await Process.run('git', ['clone', 'https://github.com/TeamUltroid/Ultroid', 'TeamUltroid'], runInShell: true);
  print(
    "${'Installing Ultroid Dependencies [ '.cyan}"
    "${'root://TeamUltroid/requirements.txt'.brightMagenta}"
    "${' ]'.cyan}"
  );
  await Process.run(
    'pip', ['install', '-r', '-U', 'requirements.txt'],
    runInShell: true,
    workingDirectory: rootDirectory.absolute.uri.toFilePath()
  );
  await Process.run(
    'pip',
    ['install', '-U', 'optional-requirements.txt'],
    runInShell: true,
    workingDirectory: Directory('./TeamUltroid/resources/startup').absolute.uri.toFilePath()
  );
  print(
    "${'Successfully Installed Ultroid Dependencies [ '.cyan}"
    "${'root://TeamUltroid/requirements.txt'.brightMagenta}"
    "${' ]'.cyan}"
  );
  print("Running [ ${'ultroid version'.brightMagenta} ]\n");
  version();
  print('To run Ultroid, use the command [ ultroid run ]'.brightGreen);
}
