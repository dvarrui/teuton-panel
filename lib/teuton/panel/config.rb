require "fileutils"
require "tty-prompt"
require "yaml"

module Teuton::Panel
  class Config
    attr_reader :data

    def initialize(basedir)
      @basedir = basedir
      @data = load
    end

    def [](key)
      @data[key]
    end

    private

    def load
      filepath = File.join(@basedir, CONFIGFILE)

      unless File.exist?(filepath)
        prompt = TTY::Prompt.new
        action = prompt.yes?("Create configuration file?")
        if action
          create filepath
        else
          puts "Bye!"
          exit 1
        end
      end
      YAML.load(File.read(filepath))
    end

    def create(target)
      source = File.join(__dir__, "files", CONFIGFILE)
      FileUtils.cp(source, target)
      puts "Configuration file created."
    end
  end
end