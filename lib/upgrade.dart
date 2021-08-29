// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorize/colorize.dart';
import 'dart:io';

// Ultroid
import 'package:ultroid_cli/version.dart';

void upgradeUltroid() async {
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      "[ ${Colorize('root://TeamUltroid').lightMagenta()} ] does not exists.\n"
      "Run [ ${Colorize('ultroid init').lightGreen()} ] first to install the repository and dependencies."
    );
    exit(1);
  }
  await rootDirectory.delete(recursive: true);
  print(Colorize('Installing an upgraded version of Ultroid to [ ').cyan().toString() + Colorize('root://TeamUltroid').lightMagenta().toString() + Colorize(' ]').cyan().toString());
  await Process.run('git', ['clone', 'https://github.com/TeamUltroid/Ultroid', 'TeamUltroid'], runInShell: true);
  print(
    "${Colorize('Installing Ultroid Dependencies [ ').cyan()}"
    "${Colorize('root://TeamUltroid/requirements.txt').lightMagenta()}"
    "${Colorize(' ]').cyan()}"
  );
  await Process.run(
    'pip', ['install', '-r', '-U', 'requirements.txt'],
    runInShell: true,
    workingDirectory: rootDirectory.absolute.uri.toFilePath()
  );
  for (var eachRequirement in [
    'fonttools',
    'covid',
    'gtts',
    'pokedex.py',
    'pyshorteners',
    'pyfiglet',
    'pyjokes',
    'quotefancy',
    'wikipedia',
    'textblob',
    'lyrics_extractor==3.0.1',
  ]) {
    await Process.run(
      'pip', ['install', '-U', eachRequirement],
      runInShell: true,
      workingDirectory: rootDirectory.absolute.uri.toFilePath()
    );
  }
  print(
    "${Colorize('Successfully Installed Ultroid Dependencies [ ').cyan()}"
    "${Colorize('root://TeamUltroid/requirements.txt').lightMagenta()}"
    "${Colorize(' ]').cyan()}"
  );
  print("Running [ ${Colorize('ultroid version').lightMagenta()} ]\n");
  version();
  print(Colorize('To run Ultroid, use the command [ ultroid run ]').lightGreen());
}
