require "thor"
require_relative "version"
require_relative "../panel"

class CLI < Thor
  map ["h", "-h", "--help"] => "help"

  map ["n", "-n", "--new"] => "new"
  desc "new DIRECTORY", "Create skeleton for a new project"
  long_desc <<-LONGDESC
  Create files for a new project.
  LONGDESC
  def new(projectpath)
    Teuton.create(projectpath)
  end

  map ["--run", "run"] => "play"
  desc "[run] [DIRECTORY]", "Run Teuton Panel from directory"
  long_desc <<-LONGDESC
  This function execute challenge from specified directory.
  By default, show progress on the screen.

  Let's see others options:

  (1) teuton foo, run challenge from foo/start.rb with foo/config.yaml config file.

  (2) teuton run foo, same as (1).

  (3) teuton run --export=json foo, run challenge and export using json format.
  Others output formats availables are: txt, html, yaml, json and colored_text.

  (4) teuton run --cname=demo foo, run challenge from foo/start.rb with foo/demo.yaml config file.

  (5) teuton foo/demo.rb, Run challenge from foo/demo.rb with foo/demo.yaml config file.

  LONGDESC
  def play(filepath)
    Teuton::Panel.run(filepath, options)
  end

  map ["v", "-v", "--version"] => "version"
  desc "version", "Show the program version"
  def version
    puts "#{Teuton::Panel::APPNAME} version #{Teuton::Panel::VERSION}"
  end

  ##
  # These inputs are equivalents:
  # * teuton-panel dir/foo
  # * teuton-panel run dir/foo
  def method_missing(method, *_args, &_block)
    play(method.to_s)
  end

  def respond_to_missing?(method_name, include_private = false)
    # Respond to missing methods name
    super
  end
end
