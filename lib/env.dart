// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:colorize/colorize.dart';

void dotEnvController(List<String> cliArguments) {
  final filePath = './TeamUltroid/.env';
  final dotEnv = DotEnv(filePath: filePath);
  if (!dotEnv.exists()) {
    print(Colorize('Env file not found ! [ ${Colorize(filePath).lightGreen()} ${Colorize("]").lightRed()}').lightRed());
  }
  if (cliArguments.length < 2 && cliArguments[0].contains('.')) {
    return print(Colorize('Usage: ${Colorize("ultroid env.<key> <value>").cyan()}').lightRed());
  }
  if (cliArguments[0].split('.')[1] == '') {
    return print(Colorize('Error: Invalid key supplied !').lightRed());
  }
  switch (cliArguments[0].split('.')[1]) {
    case 'create':
      print(['ultroid', 'env.create', 'new']);
      dotEnv.createNew(recrusive: true);
      print(Colorize('New env file created ! [ ${Colorize(filePath).lightGreen()} ${Colorize("]").cyan()}').cyan());
      break;
    case 'get':
      print(['ultroid', 'env.get', 'all']);
      dotEnv.getDotEnv().forEach((String key, String value) {
        print(Colorize(key).lightMagenta().toString() + ' -> ' + Colorize(value).lightGreen().toString());
      });
      break;
    default:
      print(['ultroid', cliArguments[0], cliArguments[1]]);
      dotEnv.getDotEnv();
      dotEnv.set(cliArguments[0].split('.')[1], cliArguments[1]);
      dotEnv.saveDotEnv();
      print(Colorize('Key "${Colorize(cliArguments[0].split('.')[1]).green()}${Colorize('"').cyan()} ${Colorize("has been saved to [ ${Colorize(filePath).lightMagenta()}").cyan().default_slyle()} ${Colorize("]").cyan()}').cyan());
  }
}
