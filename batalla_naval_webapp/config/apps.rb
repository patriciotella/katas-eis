Padrino.configure_apps do
  # enable :sessions
  set :session_secret, ENV['session_secret']
  set :protection, true
  set :protect_from_csrf, true
end

# Mounts the core application for this project
Padrino.mount('Battleship::App', :app_file => Padrino.root('app/app.rb')).to('/')
