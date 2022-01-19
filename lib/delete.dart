// UltroidCli
// Copyright (C) 2022 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

import 'package:colorx/colorx.dart';
import 'dart:io';

// Ultroid
import 'package:ultroid_cli/version.dart';

void deleteUltroid() async {
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print('\"Ultroid\" at [ ${C"root://TeamUltroid".brightMagenta} ] does not exist !'.cyan);
  } else {
    print('Removing \"Ultroid\" at [ ${"root://TeamUltroid".brightMagenta} ]'.cyan);
    rootDirectory.deleteSync(recursive: true);
    print('Succesfully removed \"Ultroid\" at [ ${"root://TeamUltroid".brightMagenta} ]'.cyan);
  }
  version();
  print('To install \"Ultroid\", use the command [ ultroid init ]'.brightGreen);
}
