module Teuton::Panel
  class Project
    attr_reader :dirpath

    def initialize(dirpath)
      @dirpath = dirpath
    end

    def to_s
      "Project: #{@dirpath}"
    end
  end

  module Projects
    def self.all(basedir)
      projects = []
      files = Dir.glob("#{basedir}/**/start.rb")
      files.map do 
        dirpath = File.dirname(_1)
        projects << Project.new(dirpath)
      end

      if projects.size.zero?
        puts "No projects were found in the directory! (#{basedir})"
        exit 1
      end

      projects  
    end
  end
end