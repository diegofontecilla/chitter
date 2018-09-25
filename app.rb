require 'sinatra/base'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peeps.all
    @user = session[:user]
    erb :index
  end

  post '/user_details' do
    session[:user] = User.create(params[:email], params[:password], params[:name], params[:username])
    redirect '/'
  end

  post '/new_comment' do
    Peeps.add_peep(params[:comment])
    redirect '/'
  end

  run! if app_file == $0
end
