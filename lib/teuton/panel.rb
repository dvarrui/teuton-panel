# frozen_string_literal: true

require_relative "panel/config"
require_relative "panel/project"
require_relative "panel/version"

module Teuton
  module Panel
    def self.run(basedir)
      projects = Projects::all(basedir)
      config = Config.new(basedir)
    end
  end
end
