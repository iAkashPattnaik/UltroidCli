// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';
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
  for (var i in [
    'help',
    '-h',
    '--help',
    '-v',
    'version',
    'run',
    'heroku',
    'session',
    'upgrade',
    'init',
    'delete',
    'env',
    'docs',
    'support',
    'twitter'
  ]) {
    if (!query.toLowerCase().startsWith(i)) {
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
    case 'heroku':
      runUltroidHeroku();
      break;
    case 'session':
      generateSession();
      break;
    case 'delete':
      deleteUltroid();
      break;
    case 'env':
      dotEnvController(arguments);
      break;
    case 'docs':
      urlLauncher('Docs', 'https://ultroid.tech');
      break;
    case 'support':
      urlLauncher('Support', 'https://telegram.dog/TheUltroid');
      print("[ ${'Advice'.brightGreen} ] - Join for latest updates !");
      break;
    case 'twitter':
      urlLauncher('Twitter', 'https://twitter.com/AKASH_AM1');
      urlLauncher('Twitter', 'https://twitter.com/TheUltroid');
      print("[ ${'Advice'.brightGreen} ] - Follow for latest updates !");
      break;
    default:
      printHelp();
  }
}
