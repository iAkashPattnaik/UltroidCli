// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';

void printHelp() {
  print(
    'Manage Ultroid with UltroidCli\n'
    '\n'
    'Common commands:\n'
    '  ${"ultroid run".cyan}\n'
    '    Run Ultroid Instantly.\n'
    '  ${"ultroid upgrade".cyan}\n'
    '    Upgrade Ultroid Without Starting It.\n'
    '\n'
    'Usage: ultroid <command> [optional-arguments]\n'
    'Global options:\n'
    '    ${"-h, --help    Print this usage information.".cyan}\n'
    '    ${"-v, version   Print the required and current Python version.".cyan}\n'
    '\n'
    'Primary Commands:\n'
    '    ${"init             :   ".cyan}Install Ultroid to root://TeamUltroid.\n'
    '    ${"run              :   ".cyan}Run Ultroid instantly.\n'
    '    ${"heroku           :   ".cyan}Run Ultroid for Heroku via Dockerfile.\n'
    '    ${"session          :   ".cyan}Run Session Generator.\n'
    '    ${"upgrade          :   ".cyan}Upgrade Ultroid to the latest version.\n'
    '    ${"-h, help         :   ".cyan}Print this usage information.\n'
    '    ${"-v, version      :   ".cyan}Print the version of all required dependencies.\n'
    '    ${"env.<key> <value>:   ".cyan}Update [ ${"root://TeamUltroid/.env".green} ] from cli.\n'
    '\n'
    'Secondary Commands:\n'
    '    ${"docs             :   ".cyan}Open Ultroid and Ultroidcli docs.\n'
    '    ${"twitter          :   ".cyan}Open official Twitter handles.\n'
    '    ${"support          :   ".cyan}Open Ultroid support telegram group.\n'
    '\n'
    '[ ${"Warning".green} ]\n'
    'Run \"${"ultroid delete".red}\" only when advised by the devs at \"https://t.me/UltroidSupport, or only if you know what it does !\"\n'
  );
}