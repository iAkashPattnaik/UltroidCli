// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:colorx/colorx.dart';

void dotEnvController(List<String> cliArguments) {
  final filePath = './TeamUltroid/.env';
  final dotEnv = DotEnv(filePath: filePath);
  if (!dotEnv.exists()) {
    print('Env file not found ! [ ${filePath.brightGreen} ${"]".brightRed}'.brightRed);
  }
  if (cliArguments.length < 2 && cliArguments[0].contains('.')) {
    return print('Usage: ${"ultroid env.<key> <value>".cyan}'.brightRed);
  }
  if (cliArguments[0].split('.')[1] == '') {
    return print('Error: Invalid key supplied !'.brightRed);
  }
  switch (cliArguments[0].split('.')[1]) {
    case 'create':
      dotEnv.createNew(recrusive: true);
      print('New env file created ! [ ${filePath.brightGreen} ${"]".cyan}'.cyan);
      break;
    case 'get':
      dotEnv.getDotEnv().forEach((String key, String value) {
        print('${key.brightMagenta} -> ${value.brightGreen}');
      });
      break;
    default:
      dotEnv.getDotEnv();
      dotEnv.set(cliArguments[0].split('.')[1], cliArguments[1]);
      dotEnv.saveDotEnv();
      print('Key "${cliArguments[0].split('.')[1].green}${'"'.cyan} ${"has been saved to [ ${filePath.brightMagenta}".cyan} ${"]".cyan}'.cyan);
  }
}
