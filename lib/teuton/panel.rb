# frozen_string_literal: true

require_relative "panel/app"
require_relative "panel/config"
require_relative "panel/project"
require_relative "panel/version"

module Teuton::Panel
  def self.up(basedir)
    projects = Projects::all(basedir)
    config = Config.new(basedir)
    App.run!
  end
end
