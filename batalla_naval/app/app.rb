require_relative '../app/models/battle_ship'


module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers
    register Padrino::Mailer
    #register Padrino::Sprockets
    #register Padrino::Admin::AccessControl
    #sprockets :minify => (Padrino.env == :production)


    use Rack::Session::Pool
    disable :protect_from_csrf
    enable :sessions

    get '/' do
        File.read(File.join('public', 'index.html'))
    end

    get 'mipagina' do
      render 'batalla/inicio'
    end

    post 'creation' do
      #@xBoard = params[:xBoard]
      #@yBoard = params[:yBoard]
      #@game = Board.new(@xBoard.to_i,@yBoard.to_i)
      #session[:game] = @game
      @game = Board.new(params[:xBoard],params[:yBoard])
      session[:game] = @game
      render 'batalla/inicio'
    end

    post 'getCoord' do
      @xCoord = params[:xCoord]
      @yCoord = params[:yCoord]
      @coord_result = session[:game].get_data_of(@xCoord.to_i,@yCoord.to_i)
      render 'batalla/inicio'
    end

    post 'alocate_small_ship' do
      #@xSmallCoord = params[:xSmallCoord]
      #@ySmallCoord = params[:ySmallCoord]
      #@game = session[:game]
      #@game.alocate_small_ship_in(@xSmallCoord.to_i,@ySmallCoord.to_i)
      #session[:game]=@game
      session[:game].alocate_small_ship_in(params[:xSmallCoord],params[:ySmallCoord])
      render 'batalla/inicio'
    end

    post 'alocate_large_ship' do
      @xLargeCoord = params[:xLargeCoord]
      @yLargeCoord = params[:yLargeCoord]
      @game = session[:game]
      @game.alocate_large_ship_in(@xLargeCoord.to_i,@yLargeCoord.to_i)
      session[:game]=@game
      render 'batalla/inicio'
    end

    post 'shoot_position' do
      @xShootCoord = params[:xShootCoord]
      @yShootCoord = params[:yShootCoord]
      @game = session[:game]
      @shooting_result = @game.shoot_position(@xShootCoord.to_i,@yShootCoord.to_i).to_s
      session[:game]=@game
      render 'batalla/inicio'
    end

  end
end