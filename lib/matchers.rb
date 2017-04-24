MATCHERS = {
  /\.rb$/ => {
    lang: 'Ruby',
    matchers: [
      {
        name: "require 'byebug'",
        regex: /^require ['"]byebug['"]/
      },
      {
        name: "require 'debugger'",
        regex: /^require ['"]debugger['"]/
      },
      {
        name: 'debugger',
        regex: /debugger/
      },
      {
        name: 'puts',
        regex: /^\s*puts/
      },
      {
        name: 'print',
        regex: /^\s*print/
      }
    ]
  },
  /\.jsx?$/ => {
    lang: 'JavaScript',
    matchers: [
      {
        name: 'debugger',
        regex: /debugger/
      },
      {
        name: 'console',
        regex: /^\s*console\.(log|warn|debug|error|info)/
      }
    ]
  },
  /\.py$/ => {
    lang: 'Python',
    matchers: [
      {
        name: 'print',
        regex: /^\s*print/
      },
      {
        name: 'import pdb',
        regex: /^import pdb/
      },
      {
        name: 'pdb.set_trace',
        regex: /^\s*pdb\.set_trace/
      }
    ]
  },
  /\.php?$/ => {
    lang: 'PHP',
    matchers: [
      {
        name: 'var_dump',
        regex: /^\s*var_dump/
      },
      {
        name: 'print_r',
        regex: /^\s*print_r/
      }
    ]
  },
}.freeze
