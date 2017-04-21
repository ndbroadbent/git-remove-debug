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
        regex: /^\s*debugger/
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
        regex: /^\s*debugger/
      },
      {
        name: 'console',
        regex: /^\s*console\.(log|warn|debug|error)/
      }
    ]
  },
  /\.py$/ => {
    lang: 'Python',
    matchers: [
      {
        name: 'print',
        regex: /^\s*print\s+['"]/
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
  }
}.freeze
