## git-remove-debug

This is a small script that parses the output from `git diff`, and deletes any **new** lines that are "debugging statements". You can also pass a custom regex.

It also has an "interactive" mode, similar to `git add -p` or `git checkout -p`. When running in interactive mode, it will ask you whether or not you want to delete each line. It will only delete everything at the end, so you can use ctrl+C to cancel at any time.

## Debugging Statements

99% of my debugging statements are just a single line, maybe with some indentation at the beginning. If you have a multi-line `console.log` statement, then you'll have to delete that manually.

### JavaScript

* Filename regex: `/\.jsx?$/`
* Debugging statement regex:

```js
/^\s*console\.log/
```

### Ruby

* Filename regex: `/\.rb$/`
* Debugging statement regex:

```js
/^\s*puts ['"]/
```

### Python

* Filename regex: `/\.py$/`
* Debugging statement regex:

```js
/^\s*print ['"]/
```

### Others

Pull requests welcome!

## Usage

```bash
# Automatically deletes all new debugging statements
$ git-remove-debug

# Deletes all new debugging statements from a given file
$ git-remove-debug <file>

# Asks you if you want to delete each debugging statement
$ git-remove-debug -p
```
