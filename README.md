## git-remove-debug

![demo-gif](https://cloud.githubusercontent.com/assets/139536/25284863/916d0780-26e2-11e7-8669-c1c1f49b7d5c.gif)

-----------------------------------

This is a small script that parses the output from `git diff`. By default, it deletes any **new** or **changed** lines that are "debugging statements". You can also pass a custom regex to match lines.

You can pass the `-a` flag (or `--all`) to remove debugging statements from all files that are checked in to the git repository.

The script will show you every line that it is about to delete, and will ask you to confirm the changes. You can skip the confirmation by using the `-f` (or `--force`) option.

The script also has an patch mode, similar to `git add -p` or `git checkout -p`. You can use patch mode with the `-p` flag (or `--patch`). When running in patch mode, the script will prompt you to confirm every individual line. You can press `q` or `Ctrl+C` to cancel at any time. You can also press `d` to skip the rest of the lines, and only delete what you have already confirmed.

> NOTE: Unlike `git add -p`, you don't have to press return after pressing 'y' or 'n'.


## Disclaimer and Backups

This software is provided without warranty of any kind. By using this script, you agree and understand that I can not be held personally responsible for any data loss.

To protect against loss of data, the script will make a backup copy of any file that it touches. The backup path will be displayed in the console.

Please note that this script may not work for all encodings and line endings. You should also be very careful if your filenames contain any spaces or UTF8 characters.


## Recognized Debugging Statements

This script removes any **new** or **changed** lines that contain debugger calls or print statements.

99% of my print statements are just a single line. If you have a multi-line print statement, you'll have to delete that manually for now. (Pull requests are welcome!)


### JavaScript

* Sxtensions: `/\.jsx?$/`
* Removes:
  * `console.log`
  * `debugger`

### Ruby

* Extensions: `/\.rb$/`
* Removes:
  * `puts`
  * `print`
  * `debugger`
  * `require 'byebug'`    *(Ruby >= 2.0)*
  * `require 'debugger'`  *(Ruby <= 1.9)*

### Python

* Extensions: `/\.py$/`
* Removes:
  * `print`
  * `import pdb`
  * `pdb.set_trace`

### Others

Pull requests are welcome!


## Usage

```bash
$ git-remove-debug --help

Usage: git-remove-debug [options] [files]
    -r, --regex=REGEX                Use a custom regex for changed lines
    -l, --lang=LANGUAGE              Use the regex for the given language
    -p, --patch                      Asks you to confirm the deletion of each matching line
    -a, --all                        Scans all files that are checked in to the git repository
    -f, --force                      Does not prompt before deleting lines
    -h, --help                       Show this message

# Deletes any debugging statements from any new or changed files.
# Will show you all changes and will ask you to confirm before deleting.
$ git-remove-debug

# Scans all files that are checked in to the git repository.
# You can pass a subdirectory, and it will only scan files in that directory (recursively.)
$ git-remove-debug -a  # (or --all)

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

Either Mac or Linux, and a version of Ruby >= 2.0.0.

This script does not use any Ruby gems.


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
