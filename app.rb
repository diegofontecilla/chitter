require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/new_comment' do
    comment = params[:comment]
    Peeps.add_peep(comment)
    redirect '/'
  end

  # get '/new_comment' do
  #   @peeps = Peeps.all
  #   erb :new_comment
  # end

  run! if app_file == $0
end
