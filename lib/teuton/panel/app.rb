
require "sinatra/base"

module Teuton::Panel
  class App < Sinatra::Base
    # Configuración opcional del servidor
    set :bind, '0.0.0.0'
    set :port, 4567
    set :public_folder, File.dirname(__FILE__) + '/public'
  
    get '/' do
      projects = settings.panel_projects
      config = settings.panel_config
      
      output = "<h1>Proyectos de Teuton Panel</h1>"
      output += "<ul>"
      projects.each do |project|
        output += "<li>#{project}</li>" 
      end      
      output += "</ul>"

      output += "<pre>#{config.data}</pre>"
      output
    end
  end  
end
