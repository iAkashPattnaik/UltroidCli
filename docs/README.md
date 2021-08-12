# Usage
It's really simple to use UltroidCli.

## `ultroid.exe`
When you run just `ultroid.exe` it will show a help menu.
Similar output will come when using with arguments [`'-h'`, `'help'`, `'--help'`].

## `ultorid init`
When you run `ultroid init` it will clone the `ultroid` repository and install all the default dependencies.


## `ultroid run`
When you run `ultroid run` it will run the `ultroid` if exists wlse will prompt to use `ultroid init` first.


## `ultroid upgrade`
When you run `ultroid upgrade` it will upgrade the current installation of ultroid to the latest one.


## `ultroid version`
When you run `ultroid version` it will print the current `python` , `pip` and `dart` (optional) versions and tell if you are eligible to run ultroid or not.


## `ultroid env.<key> <value>`
This is the best command so far.

This will act as a bridge between `root://TeamUltrod/.env` and the cli.

### Various methods -
- `ultroid env.set <key> <value>` - Append this set of data to [`root://TeamUltrod/.env`]
- `ultroid env.get all` - Print all the values of [`root://TeamUltrod/.env`]
- `ultroid env.create new` - Create a new [`.env`] file
