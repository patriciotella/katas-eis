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
      @xBoard = params[:xBoard]
      @yBoard = params[:yBoard]
      @game = Board.new(@xBoard.to_i,@yBoard.to_i)
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
      @xSmallCoord = params[:xSmallCoord]
      @ySmallCoord = params[:ySmallCoord]
      @game = session[:game]
      @game.alocate_small_ship_in(@xSmallCoord.to_i,@ySmallCoord.to_i)
      session[:game]=@game
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
    ##
    # Caching support
    #
    # register Padrino::Cache
    # enable :caching
    #
    # You can customize caching store engines:
    #
    # set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
    # set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
    # set :cache, Padrino::Cache::Store::Memory.new(50)
    # set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
    #

    ##
    # Application configuration options
    #
    # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
    # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, 'foo/bar' # Location for static assets (default root/public)
    # set :reload, false            # Reload application files (default in development)
    # set :default_builder, 'foo'   # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, 'bar'       # Set path for I18n translations (default your_apps_root_path/locale)
    # disable :sessions             # Disabled sessions by default (enable if needed)
    # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    ##
    # You can configure for a specified environment like:
    #
    #   configure :development do
    #     set :foo, :bar
    #     disable :asset_stamp # no asset timestamping for dev
    #   end
    #

    ##
    # You can manage errors like:
    #
    #   error 404 do
    #     render 'errors/404'
    #   end
    #
    #   error 505 do
    #     render 'errors/505'
    #   end
    #
  end
end