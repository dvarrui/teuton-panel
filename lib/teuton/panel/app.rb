
require "sinatra/base"

module Teuton::Panel
  class App < Sinatra::Base
    # Configuración opcional del servidor
    set :bind, '0.0.0.0'
    set :port, 4567
    set :public_folder, File.dirname(__FILE__) + '/public'
  
    get '/' do
      '¡Aplicación Sinatra funcionando dentro de una clase!'
    end
  
    # Iniciar el servidor si este archivo se ejecuta directamente
    # run! if app_file == $0
  end  
end
