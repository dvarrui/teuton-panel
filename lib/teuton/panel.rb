# frozen_string_literal: true

require_relative "panel/project"
require_relative "panel/version"

module Teuton
  module Panel
    class Error < StandardError; end
    # Your code goes here...
    # 
    def self.run(basedir)
      projects = Projects::all(basedir)
      if projects.size.zero?
        puts "No projects were found in the directory! (#{basedir})"
        exit 1
      end
      projects.each { puts _1 }
    end
  end
end
