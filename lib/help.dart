// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorize/colorize.dart';

void printHelp() {
  print(
    'Manage Ultroid with UltroidCli\n'
    '\n'
    'Common commands:\n'
    '  ${Colorize("ultroid run").cyan()}\n'
    '    Run Ultroid Instantly.\n'
    '  ${Colorize("ultroid upgrade").cyan()}\n'
    '    Upgrade Ultroid Without Starting It.\n'
    '\n'
    'Usage: ultroid <command> [optional-arguments]\n'
    'Global options:\n'
    '    ${Colorize("-h, --help    Print this usage information.").cyan()}\n'
    '    ${Colorize("-v, version   Print the required and current Python version.").cyan()}\n'
    '\n'
    'Primary Commands:\n'
    '    ${Colorize("init             :   ").cyan()}Install Ultroid to root://TeamUltroid.\n'
    '    ${Colorize("run              :   ").cyan()}Run Ultroid instantly.\n'
    '    ${Colorize("heroku           :   ").cyan()}Run Ultroid for Heroku via Dockerfile.\n'
    '    ${Colorize("session          :   ").cyan()}Run Session Generator.\n'
    '    ${Colorize("upgrade          :   ").cyan()}Upgrade Ultroid to the latest version.\n'
    '    ${Colorize("-h, help         :   ").cyan()}Print this usage information.\n'
    '    ${Colorize("-v, version      :   ").cyan()}Print the version of all required dependencies.\n'
    '    ${Colorize("env.<key> <value>:   ").cyan()}Update [ ${Colorize("root://TeamUltroid/.env").green()} ] from cli.\n'
    '\n'
    'Secondary Commands:\n'
    '    ${Colorize("docs             :   ").cyan()}Open Ultroid and Ultroidcli docs.\n'
    '    ${Colorize("twitter          :   ").cyan()}Open official Twitter handles.\n'
    '    ${Colorize("support          :   ").cyan()}Open Ultroid support telegram group.\n'
    '\n'
    '[ ${Colorize("Warning").green()} ]\n'
    'Run \"${Colorize("ultroid delete").red()}\" only when advised by the devs at \"https://t.me/UltroidSupport, or only if you know what it does !\"\n'
  );
}