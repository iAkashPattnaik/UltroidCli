import 'package:colorize/colorize.dart';
import 'dart:io';

// Ultroid
import 'package:ultroid_cli/version.dart';

// UltroidCli
// Copyright (C) 2021 Akash Pattnaik
//
// This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
// PLease read the GNU Affero General Public License in
// <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

String selfVersion = '1.0.2';

void init() async {
  if (Platform.isWindows) {
    var client = HttpClient();
    await client.getUrl(
      Uri.parse(
        'https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/$selfVersion/sessionGen.exe'
      )
    ).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
        response.pipe(File('./sessionGen.exe').openWrite());
    });
  } else {
    var client = HttpClient();
    await client.getUrl(
      Uri.parse(
        'https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/$selfVersion/sessionGen.exe'
      )
    ).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
        response.pipe(File('./sessionGen').openWrite());
    });
  }
  final rootDirectory = Directory('./TeamUltroid');
  if (!rootDirectory.existsSync()) {
    print(
      Colorize(
        'Installing Ultroid to [ ${Colorize("root://TeamUltroid").lightMagenta()} ]'
      )
    .cyan());
    await Process.run(
      'git',
      ['clone', 'https://github.com/TeamUltroid/Ultroid', 'TeamUltroid'],
      runInShell: true
    );
    print(
      "${Colorize('Successfully Installed Ultroid to [ ').cyan()}"
      "${Colorize('root://TeamUltroid/').lightMagenta()}"
      "${Colorize(' ]').cyan()}"
    );
    print(
      "${Colorize('Installing Ultroid Dependencies [ ').cyan()}"
      "${Colorize('root://TeamUltroid/requirements.txt').lightMagenta()}"
      "${Colorize(' ]').cyan()}"
    );
    await Process.run('pip', ['install', '-r', '-U', 'requirements.txt'],
      runInShell: true,
      workingDirectory: rootDirectory.absolute.uri.toFilePath());
    for (var eachRequirement in [
      'fonttools',
      'covid',
      'gtts',
      'pokedex.py',
      'pyshorteners',
      'pyfiglet',
      'pyjokes',
      'quotefancy',
      'wikipedia',
      'textblob',
      'lyrics_extractor==3.0.1',
      'aiohttp==3.7.4.post0',
      'akinator.py',
      'apscheduler',
      'bs4',
      'cairosvg',
      'enhancer==0.1.8',
      'gdown',
      'gingerit',
      'git+https://github.com/buddhhu/img2html.git',
      'git+https://github.com/New-dev0/instagrapi.git',
      'git+https://github.com/1danish-00/carbon-now-sh-api-wrapper.git',
      'git+https://github.com/programmingerror/heroku3.py.git',
      'git+https://github.com/1danish-00/google_trans_new.gitv',
      'gitpython==3.1.23',
      'google-api-python-client==1.7.11',
      'google-auth-httplib2==0.0.4',
      'google-auth-oauthlib==0.4.4',
      'google-auth==1.27.1',
      'html-telegraph-poster==0.4.0',
      'htmlwebshot==0.1.2',
      'lottie==0.6.9',
      'multiprocess==0.70.12.2',
      'numpy==1.21.2',
      'oauth2client==4.1.3',
      'opencv-python-headless',
      'pillow>=7.0.0',
      'profanitydetector',
      'psutil==5.8.0',
      'pypdf2==1.26.0',
      'pytz==2021.1',
      'pyyaml==5.4.1',
      'qrcode==7.3',
      'requests==2.26.0',
      'scikit-image==0.18.2',
      'shazamio==0.0.5',
      'tabulate==0.8.9',
      'telegraph',
      'tgcrypto',
      'youtube-search-python==1.4.7',
      'youtube_dl==2021.6.6',
    ]) {
      await Process.run('pip', ['install', '-U', eachRequirement],
        runInShell: true,
        workingDirectory: rootDirectory.absolute.uri.toFilePath()
      );
    }
    print(
      "${Colorize('Successfully Installed Ultroid Dependencies [ ').cyan()}"
      "${Colorize('root://TeamUltroid/requirements.txt').lightMagenta()}"
      "${Colorize(' ]').cyan()}"
    );
  }
  version();
  print(Colorize('To run Ultroid, use the command [ ultroid run ]').lightGreen());
}
