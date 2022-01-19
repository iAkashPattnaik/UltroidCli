// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';
import 'dart:io';

import 'package:ultroid_cli/version.dart';

String selfVersion = '1.0.7';

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
      "${'Installing Ultroid to [ '.cyan}"
      "${'root://TeamUltroid/'.brightMagenta}"
      "${' ]'.cyan}"
    );
    await Process.run(
      'git',
      ['clone', 'https://github.com/TeamUltroid/Ultroid', 'TeamUltroid'],
      runInShell: true
    );
    print(
      "${'Successfully Installed Ultroid to [ '.cyan}"
      "${'root://TeamUltroid/'.brightMagenta}"
      "${' ]'.cyan}"
    );
    print(
      "${'Installing Ultroid Dependencies [ '.cyan}"
      "${'root://TeamUltroid/requirements.txt'.brightMagenta}"
      "${' ]'.cyan}"
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
      "${'Successfully Installed Ultroid Dependencies [ '.cyan}"
      "${'root://TeamUltroid/requirements.txt'.brightMagenta}"
      "${' ]'.cyan}"
    );
  }
  version();
  print('To run Ultroid, use the command [ ultroid run ]'.brightGreen);
}
