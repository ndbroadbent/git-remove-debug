## git-remove-debug

This is a small script that parses the output from `git diff`, and deletes any **new** lines that are "debugging statements". You can also pass a custom regex.

By default, the script will show all of the lines that it will delete, and it will ask you to confirm. You can skip the confirmation by using the `-f` (or `--force`) option.

It also has an `patch` mode, similar to `git add -p` or `git checkout -p`. You can enable patch mode with the `-p` flag. When running in this mode, the script will ask you to confirm each individual line. You can use `Ctrl+C` to cancel at any time.

## Disclaimer

This software is provided without warranty of any kind, and I can not be held responsible for any lost data.

## Automatic Backups

This script will make a a backup of every file that it touches. The paths will be displayed in the console.

## Debugging Statements

99% of my debugging statements are just a single line, maybe with some indentation at the beginning. If you have a multi-line `console.log` statement, then you'll have to delete that manually. (But pull requests are welcome!)

### JavaScript

* Filename regex: `/\.jsx?$/`
* Line regex:

```js
/^\s*console\.log/
```

### Ruby

* Filename regex: `/\.rb$/`
* Line regex:

```js
/^\s*puts ['"]/
```

### Python

* Filename regex: `/\.py$/`
* Line regex:

```js
/^\s*print ['"]/
```

### Others

Pull requests welcome!

## Usage

```bash
$ git-remove-debug --help

Usage: git-remove-debug [options] [files]
    -r, --regex=REGEX                Use a custom regex for changed lines
    -l, --lang=LANGUAGE              Use the regex for the given language
    -p, --patch                      Asks you to confirm the deletion of each matching line
    -f, --force                      Does not prompt before deleting lines

# Deletes any new debugging statements from any changed files that are supported.
# Will show you all changes and will ask you to confirm before deleting.
$ git-remove-debug

# Delete all debugging statements without confirmation.
$ git-remove-debug -f  # (or --force)

# Deletes any new debugging statements from a given file
# (All extra arguments are just passed to `git diff`)
$ git-remove-debug <file>

# Use "patch" mode. This will ask you to confirm the deletion of each matching line.
$ git-remove-debug -p  # (or --patch)

# For each line, you will choose one of the following options:

# y - Yes, delete this line
# n - No, don’t delete this line
# d - No, don’t delete this line, and all other remaining lines.
# q - Quit and don't delete anything.


# Deletes new lines in changed files, where the line matches the given regex
$ git-remove-debug -r "^\s*testing"  # (or --regex)

# Use a built-in regex for a given language.
# (Useful if you want to process files that don't have an extension)
$ git-remove-debug -l ruby  # (or --lang)
```

## Default extensions

The script has built-in support for some common Ruby files that don't have extensions:

```
Gemfile
Rakefile
Guardfile
```

## Requirements

At least Ruby 2.0.0.


## Installation

Maybe just clone the repo somewhere and put it in your `$PATH`.

```bash
cd ~
git clone https://github.com/ndbroadbent/git-remove-debug.git
export PATH=$PATH:~/git-remove-debug

# You could add that to your .bashrc:
echo "export PATH=$PATH:~/git-remove-debug" >> ~/.bashrc

# Or you could skip the PATh, and just set up an alias:
alias grd="~/git-remove-debug/git-remove-debug"
```


---------------------------------------------------

![Debug-ception](debug-ception.png)
