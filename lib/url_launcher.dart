// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorize/colorize.dart';
import 'dart:io';

void urlLauncher(String origin, String url) async {
  print('[ ${Colorize(origin).lightGreen()} ] - ${Colorize(url).cyan()}');
  if (Platform.operatingSystem == 'linux') {
    await Process.run('x-www-browser', [url], runInShell: true);
  } else if (Platform.operatingSystem == 'windows') {
    await Process.run('start', [url], runInShell: true);
  } else if (Platform.operatingSystem == 'macos') {
    await Process.run('open', [url], runInShell: true);
  }
}