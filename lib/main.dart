// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

library ultroid_cli;

import 'package:colorize/colorize.dart';
import 'package:http/http.dart';

// Ultroid
export 'package:ultroid_cli/help.dart';
export 'package:ultroid_cli/init.dart';
export 'package:ultroid_cli/version.dart';
export 'package:ultroid_cli/run.dart';
export 'package:ultroid_cli/upgrade.dart';
export 'package:ultroid_cli/delete.dart';
export 'package:ultroid_cli/env.dart';


void ultroidCliVersion() async {
  try {
    var req = await get(
      Uri.parse('https://raw.githubusercontent.com/BLUE-DEVIL1134/UltroidCli/main/version.txt'),
    );
    if (req.body.trim() != '1.0.1') {
      print(
        "  ${Colorize('╔══════════════════════════════════════════════════════════════════════════╗').cyan()}\n"
        "  ${Colorize('║').cyan()} A new version of UltroidCli is available!                                ${Colorize('║').cyan()}\n"
        "  ${Colorize('║').cyan()}                                                                          ${Colorize('║').cyan()}\n"
        "  ${Colorize('║').cyan()} Please download the lastest release.                                     ${Colorize('║').cyan()}\n"
        "  ${Colorize('╚══════════════════════════════════════════════════════════════════════════╝').cyan()}"
      );
    }
  } catch (error) {
    return;
  }
}
