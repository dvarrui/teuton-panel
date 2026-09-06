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

  map ["--run", "run"] => "runin"
  desc "[run] [DIRECTORY]", "Run Teuton Panel from directory"
  long_desc <<-LONGDESC
  This function runs panel in the specified directory.
  By default, the current directory is used.
  LONGDESC
  def runin(dirpath = ".")
    Teuton::Panel.run(dirpath)
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
    runin(method.to_s)
  end

  def respond_to_missing?(method_name, include_private = false)
    # Respond to missing methods name
    super
  end
end
