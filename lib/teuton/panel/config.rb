require "yaml"
require "tty-prompt"

module Teuton::Panel
  class Config
    def initialize(basedir)
      @basedir = basedir
      load
    end

    private

    def load
      filepath = File.join(@basedir, CONFIGFILE)

      unless File.exist?(filepath)
        prompt = TTY::Prompt.new
        action = prompt.yes?("Create the configuration file?")
        puts action
        exit 1
      end
      data = YAML.load(File.read(filepath))
      pp data
    end
  end
end