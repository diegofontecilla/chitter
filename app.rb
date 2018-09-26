require 'sinatra/base'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/new_user_details' do
    session[:user] = User.create(params[:email], params[:password], params[:name], params[:username])
    redirect '/make_a_post'
  end

  post '/creating_a_new_session' do
    user_id = User.find(params[:email], params[:password])
    session[:user] = User.get_user_by_id(user_id)
    redirect '/make_a_post'
  end

  get '/make_a_post' do
    @peeps = Peeps.all
    @user = session[:user]
    erb :make_a_post
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_comment' do
    Peeps.add_peep(params[:comment])
    redirect '/make_a_post'
  end

  run! if app_file == $0
end
