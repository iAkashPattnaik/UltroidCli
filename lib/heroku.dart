// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorize/colorize.dart';
import 'dart:io';

import 'package:dart_dotenv/dart_dotenv.dart';

void runUltroidHeroku() async {
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      "[ ${Colorize('root://TeamUltroid').lightMagenta()} ] does not exists.\n"
      "Run [ ${Colorize('ultroid init').lightGreen()} ] first to install the repository and dependencies."
    );
    exit(1);
  }
  if (File('./TeamUltroid/Dockerfile').existsSync()) {
    File('./TeamUltroid/Dockerfile').deleteSync(recursive: true);
  }
  final filePath = './TeamUltroid/.env';
  final dotEnv = DotEnv(filePath: filePath);
  if (!dotEnv.exists()) {
    print(Colorize('[.env] file not found ! [ ${Colorize(filePath).lightGreen()} ${Colorize("]").lightRed()}').lightRed());
    dotEnv.createNew(recrusive: true);
    print(Colorize('New [.env] file created ! [ ${Colorize(filePath).lightGreen()} ${Colorize("]").cyan()}').cyan());
  } else {
    print(Colorize('[.env] file found ! [ ${Colorize(filePath).lightGreen()} ${Colorize("]").cyan()}').cyan());
  }
  dotEnv.getDotEnv();
  dotEnv.set('UltroidCli', 'https://github.com/BLUE-DEVIL1134/UltroidCli/');
  dotEnv.saveDotEnv();
  await Process.start(
    'python',
    ['-m', 'pyUltroid'],
    runInShell: true,
    workingDirectory: rootDirectory.absolute.uri.toFilePath(),
    mode: ProcessStartMode.inheritStdio,
  );
}
