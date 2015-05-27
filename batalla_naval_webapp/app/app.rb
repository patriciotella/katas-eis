require_relative '../app/models/battle_ship.rb'


module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers
    register Padrino::Mailer

    enable :sessions

    get '/' do
        File.read(File.join('public', 'index.html'))
    end

    get 'mipagina' do
      render 'batalla/inicio'
    end
  end
end