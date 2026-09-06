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
        action = prompt.select("There is no configuration file!", %w(create exit))
        puts action
        exit 1
      end
      data = YAML.load(File.read(filepath))
      pp data
    end
  end
end