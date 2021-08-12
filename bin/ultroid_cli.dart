// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:ultroid_cli/main.dart';
import 'dart:io';

void main(List<String> arguments) async {
  stdout.write('\x1B[2J\x1B[0;0H');
  ultroidCliVersion();
  var query = 'help';
  var temp = 'help';
  try {
    query = arguments[0].toLowerCase();
  } catch (error) {
    query = 'help';
  }
  for (var i in ['help', '-h', '--help', '-v', 'version', 'run', 'upgrade', 'init', 'delete']) {
    if (i != query.toLowerCase()) {
      temp = 'help';
    } else {
      temp = i;
      break;
    }
  }
  query = temp;

  switch (query) {
    case '--help':
      printHelp();
      break;
    case '-h':
      printHelp();
      break;
    case 'help':
      printHelp();
      break;
    case 'version':
      version();
      break;
    case '-v':
      version();
      break;
    case 'init':
      init();
      break;
    case 'upgrade':
      upgradeUltroid();
      break;
    case 'run':
      runUltroid();
      break;
    case 'delete':
      deleteUltroid();
      break;
    default:
      printHelp();
  }
}
