// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorize/colorize.dart';
import 'dart:io';

import 'package:ultroid_cli/version.dart';

String selfVersion = '1.0.6';

void init() async {
  if (Platform.isWindows) {
    var client = HttpClient();
    await client.getUrl(
      Uri.parse(
        'https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/$selfVersion/sessionGen.exe'
      )
    ).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.pipe(File('./sessionGen.exe').openWrite());
    });
  } else {
    var client = HttpClient();
    await client.getUrl(
      Uri.parse(
        'https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/$selfVersion/sessionGen.exe'
      )
    ).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.pipe(File('./sessionGen').openWrite());
    });
  }
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      "${Colorize('Installing Ultroid to [ ').cyan()}"
      "${Colorize('root://TeamUltroid/').lightMagenta()}"
      "${Colorize(' ]').cyan()}"
    );
    await Process.run(
      'git',
      ['clone', 'https://github.com/TeamUltroid/Ultroid', 'TeamUltroid'],
      runInShell: true
    );
    print(
      "${Colorize('Successfully Installed Ultroid to [ ').cyan()}"
      "${Colorize('root://TeamUltroid/').lightMagenta()}"
      "${Colorize(' ]').cyan()}"
    );
    print(
      "${Colorize('Installing Ultroid Dependencies [ ').cyan()}"
      "${Colorize('root://TeamUltroid/requirements.txt').lightMagenta()}"
      "${Colorize(' ]').cyan()}"
    );
    await Process.run(
      'pip',
      ['install', '-r', '-U', 'requirements.txt'],
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
      "${Colorize('Successfully Installed Ultroid Dependencies [ ').cyan()}"
      "${Colorize('root://TeamUltroid/requirements.txt').lightMagenta()}"
      "${Colorize(' ]').cyan()}"
    );
  }
  version();
  print(Colorize('To run Ultroid, use the command [ ultroid run ]').lightGreen());
}
