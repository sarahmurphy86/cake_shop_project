require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cake.rb')

get '/cakes' do
  @cakes = Cake.read_all()
  erb(:"cakes/index")
end
