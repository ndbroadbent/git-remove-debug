require 'optparse'

# Wrapper around OptionParser
module Options
  DEFAULT_OPTIONS = {
    regex: nil,
    lang: nil,
    patch: false,
    all: false,
    confirm: true
  }.freeze

  def self.parse!
    options = DEFAULT_OPTIONS.dup

    OptionParser.new do |opts|
      opts.banner = 'Usage: git-remove-debug [options] [files]'

      opts.on '-r REGEX',
              '--regex=REGEX',
              'Use a custom regex for changed lines' do |r|
        options[:regex] = r
      end
      opts.on '-l LANGUAGE',
              '--lang=LANGUAGE',
              'Use the regex for a given language' do |l|
        options[:lang] = l
      end
      opts.on '-p',
              '--patch',
              'Asks you to confirm the deletion of each matching line' do
        options[:patch] = true
      end
      opts.on '-a',
              '--all',
              'Scans all files that are checked in to the git repository' do
        options[:all] = true
      end
      opts.on '-f',
              '--force',
              'Does not prompt before deleting lines' do
        options[:confirm] = false
      end

      opts.on_tail('-h', '--help', 'Show this message') do
        puts opts
        exit
      end
    end.parse!

    options
  end
end
