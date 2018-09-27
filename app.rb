require 'sinatra/base'
require 'sinatra/flash'
require './lib/peeps'
require './lib/user'
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      User.get_user_by_id(session[:current_user_id])
    end
  end

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/new_user_details' do
    new_user = User.create(params[:email], params[:password], params[:name], params[:username])
    session[:current_user_id] = new_user.id
    redirect '/make_a_post'
  end

  post '/creating_a_new_session' do
    user_id = User.find_id(params[:email], params[:password])
    if user_id != nil
      session[:current_user_id] = user_id
      redirect '/make_a_post'
    else
      flash[:notice] = "Something does not match, please try again:"
      redirect '/'
    end
  end

  get '/make_a_post' do
    @peeps = Peeps.all
    @user = current_user
    erb :make_a_post
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_comment' do
    Peeps.add_peep(params[:comment], current_user.id)
    redirect '/make_a_post'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out!"
    redirect '/'
  end

  run! if app_file == $0
end
