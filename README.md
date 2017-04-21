## git-remove-debug

This is a small script that parses the output from `git diff`, and deletes any **new** lines that are "debugging statements". You can also pass a custom regex.

It also has an "interactive" mode, similar to `git add -p` or `git checkout -p`. When running in interactive mode, it will ask you whether or not you want to delete each line. It will only delete everything at the end, so you can use ctrl+C to cancel at any time.

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
    -l, --language=LANGUAGE          Use the line regex for the given language
    -p, --interactive                Asks you before deleting any lines

# Deletes any new debugging statements from any changed files that are supported
$ git-remove-debug

# Deletes any new debugging statements from a given file
# (All extra arguments are just passed to `git diff`)
$ git-remove-debug <file>

# Asks you before deleting any new lines
$ git-remove-debug -p

# Deletes new lines in changed files, where the line matches the given regex
$ git-remove-debug -r "^\s*testing"

# Use a built-in regex for a given language.
# (Useful if you want to process files that don't have an extension)
$ git-remove-debug -l ruby
```

## Default extensions

The script has built-in support for some common Ruby files that don't have extensions:

```
Gemfile
Rakefile
Guardfile
```


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
