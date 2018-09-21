require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  post '/new_comment' do
    Peeps.add_peep(params[:comment])
    redirect 'chitter'
  end

  run! if app_file == $0
end
