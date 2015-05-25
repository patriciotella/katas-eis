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

    get 'volver' do
      render 'batalla/inicio'
    end

    get 'juegoiniciado' do
      render 'batalla/juego_iniciado'
    end

    post 'creation' do
      @xBoard = params[:xBoard]
      @yBoard = params[:yBoard]
      @game = Board.new(@xBoard.to_i,@yBoard.to_i)
      session[:game] = @game
      session[:medidas] = "#{@xBoard},#{@yBoard}"
      render 'batalla/juego_iniciado'
    end

    post 'getCoord' do
      @xCoord = params[:xCoord]
      @yCoord = params[:yCoord]
      @coord_result = session[:game].get_data_of(@xCoord.to_i,@yCoord.to_i)
      render 'batalla/juego_iniciado'
    end

    post 'alocate_small_ship' do

      begin
        @xSmallCoord = params[:xSmallCoord]
        @ySmallCoord = params[:ySmallCoord]
        @game = session[:game]
        @game.alocate_small_ship_in(@xSmallCoord.to_i,@ySmallCoord.to_i)
        session[:game]=@game
      rescue InvalidLocation => exc
        @exception_message=exc.message
      end

      render 'batalla/juego_iniciado'
    end

    post 'alocate_large_ship' do
      begin
        @xLargeCoord = params[:xLargeCoord]
        @yLargeCoord = params[:yLargeCoord]
        @game = session[:game]
        @game.alocate_large_ship_in(@xLargeCoord.to_i,@yLargeCoord.to_i)
        session[:game]=@game
      rescue InvalidLocation => exc
        @exception_message=exc.message
      end

      render 'batalla/juego_iniciado'
    end

    post 'shoot_position' do

      begin
        @xShootCoord = params[:xShootCoord]
        @yShootCoord = params[:yShootCoord]
        @game = session[:game]
        @shooting_result = @game.shoot_position(@xShootCoord.to_i,@yShootCoord.to_i)
        session[:game]=@game
      rescue InvalidLocation => exc
        @exception_message=exc.message
      end

      render 'batalla/juego_iniciado'
    end

  end
end