Pry.config.editor = 'vim'

# Custom prompt
prompt = defined?(Rails) ? Rails.application.class.parent_name : File.basename(Dir.pwd)
Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} *"}
]

# Default Command Set, add custom methods here:
default_command_set = Pry::CommandSet.new do
  command 'copy', 'Copy to clipboard' do |str|
    str = "#{_pry_.input_array[-1]}#=> #{_pry_.last_result}\n" unless str
    IO.popen('pbcopy', 'r+') { |io| io.puts str }
    output.puts "-- Copy to clipboard --\n#{str}"
  end
end

# https://github.com/kyrylo/pry-theme
# $ gem install pry-theme
# $ pry
# $ pry-theme install tomorrow-night
 Pry.config.theme = 'tomorrow-night'

# Set awesome_print as the default formatter
# https://github.com/michaeldv/awesome_print/
# $ gem install awesome_print
begin
	require 'awesome_print'
	Pry.config.print = proc { |output, value| output.puts value.ai(indent: 2) }
rescue LoadError => e
	warn "[WARN] #{e}"
	puts '$ gem install awesome_print'
end

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0].match(/(3|4)/).present?
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

Pry.config.hooks.add_hook(:when_started, :say_hi) { puts "\n\nWelcome to Pry!\n\n" }
Pry.config.hooks.add_hook(:after_session, :say_bye) { puts "\nHave a nice day! :)\n\n"}

Pry.config.commands.import(default_command_set)
