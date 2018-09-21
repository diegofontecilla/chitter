require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/new_comment' do
    Peeps.add_peep(params[:comment])
    redirect '/'
  end

  run! if app_file == $0
end
