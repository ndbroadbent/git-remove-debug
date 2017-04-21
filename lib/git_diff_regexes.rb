FILENAME_REGEX = %r{^diff --git a\/(?<filename>[^\s]+)\sb[^\s]+$}
LINE_NUMBER_REGEX = /^@@ -(?<a_line>\d+)(,(\d+))* \+(?<b_line>\d+)(,(\d+))* @@/
ADDED_LINE_REGEX = /^\+/
