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
        regex: /^\s*debugger[^\w]/
      },
      {
        name: 'puts',
        regex: /^\s*puts[^\w]/
      },
      {
        name: 'print',
        regex: /^\s*print[^\w]/
      }
    ]
  },
  /\.jsx?$/ => {
    lang: 'JavaScript',
    matchers: [
      {
        name: 'debugger',
        regex: /^\s*debugger[^\w]/
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
        regex: /^\s*print[^\w]/
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
