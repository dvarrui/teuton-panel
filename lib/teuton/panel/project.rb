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
      projects  
    end
  end
end