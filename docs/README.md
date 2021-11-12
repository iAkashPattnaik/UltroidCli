# <p align="center"><a href="https://github.com/BLUE-DEVIL1134/UltroidCli"><img src="https://github-readme-stats.vercel.app/api/pin?username=BLUE-DEVIL1134&show_icons=true&theme=dracula&hide_border=true&repo=UltroidCli"></a></p>
<p align="center">
<a href="https://github.com/BLUE-DEVIL1134/UltroidCli"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FBLUE-DEVIL1134%2FUltroidCli%2F&count_bg=%232100FF&title_bg=%2300BBFF&icon=github.svg&icon_color=%23000000&title=Views&edge_flat=false" /></a>
<img src="https://img.shields.io/badge/Version-1.0.4-blueviolet?&logo=github&style=flat" />
</p>


# Usage
It's really simple to use UltroidCli.

## `ultroid.exe`
When you run just `ultroid.exe` it will show a help menu.
Similar output will come when using with arguments [`'-h'`, `'help'`, `'--help'`].

## `ultorid init`
When you run `ultroid init` it will clone the `ultroid` repository and install all the default dependencies.


## `ultroid run`
When you run `ultroid run` it will run the `ultroid` if exists wlse will prompt to use `ultroid init` first.


## `ultroid heroku`
Use `ultroid heroku` to run Ultroid on heroku via a Dockerfile.


## `ultroid session`
When you run `ultroid session` it spawn a program to generate session string via **CLI**.


## `ultroid upgrade`
When you run `ultroid upgrade` it will upgrade the current installation of ultroid to the latest one.


## `ultroid version`
When you run `ultroid version` it will print the current `python` , `pip` and `dart` (optional) versions and tell if you are eligible to run ultroid or not.


## `ultroid env.<key> <value>`
This is the best command so far.

This will act as a bridge between `root://TeamUltrod/.env` and the cli.

### Various methods -
- `ultroid env.<key> <value>` - Append this set of data to [`root://TeamUltrod/.env`]
- `ultroid env.get all` - Print all the values of [`root://TeamUltrod/.env`]
- `ultroid env.create new` - Create a new [`.env`] file


## Video Example
https://user-images.githubusercontent.com/55914808/129194273-70ad7180-dfeb-4d1d-9de7-3874f09b0b93.mp4

## Dockerfile Example
[Refer here for `Dockerfle` Example](https://github.com/BLUE-DEVIL1134/UltroidCli/blob/main/docs/Dockerfile)
