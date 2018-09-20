require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/new_comment' do
    session[:comment] = params[:comment]
    redirect '/new_comment'
  end

  get '/new_comment' do
    erb :new_comment
  end

  run! if app_file == $0
end
