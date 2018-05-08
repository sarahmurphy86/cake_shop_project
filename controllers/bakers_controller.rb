require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cake.rb')
require_relative('../models/baker.rb')

get '/bakers' do
  @bakers = Baker.read_all()
  erb(:"bakers/index")
end
