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
    'Available commands:\n'
    '    ${Colorize("init       :   ").cyan()}Install Ultroid To root://TeamUltroid.\n'
    '    ${Colorize("run        :   ").cyan()}Run Ultroid instantly.\n'
    '    ${Colorize("upgrade    :   ").cyan()}Upgrade Ultroid to latest version.\n'
    '    ${Colorize("-h, help   :   ").cyan()}Print this usage information.\n'
    '    ${Colorize("-v, version:   ").cyan()}Print the version of all required dependencies.\n'
    '\n'
    '[ ${Colorize("Warning").green()} ]\n'
    'Run \"${Colorize("ultroid delete").red()}\" only when advised by \"t.me/xditya\"\n'
  );
}