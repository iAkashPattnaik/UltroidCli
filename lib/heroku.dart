// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';
import 'dart:io';

import 'package:dart_dotenv/dart_dotenv.dart';

void runUltroidHeroku() async {
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      "[ ${'root://TeamUltroid'.brightMagenta} ] does not exists.\n"
      "Run [ ${'ultroid init'.brightGreen} ] first to install the repository and dependencies."
    );
    exit(1);
  }
  if (File('./TeamUltroid/Dockerfile').existsSync()) {
    File('./TeamUltroid/Dockerfile').deleteSync(recursive: true);
  }
  final filePath = './TeamUltroid/.env';
  final dotEnv = DotEnv(filePath: filePath);
  if (!dotEnv.exists()) {
    print('[.env] file not found ! [ ${filePath.brightGreen} ${"]".brightRed}'.brightRed);
    dotEnv.createNew(recrusive: true);
    print('New [.env] file created ! [ ${filePath.brightGreen} ${"]".cyan}'.cyan);
  } else {
    print('[.env] file found ! [ ${filePath.brightGreen} ${"]".cyan}'.cyan);
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
