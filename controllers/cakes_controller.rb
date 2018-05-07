require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cake.rb')
require_relative('../models/baker.rb')

get '/cakes' do
  @cakes = Cake.read_all()
  erb(:"cakes/index")
end

get '/cakes/new' do
  @cakes = Cake.read_all()
  @bakers = Baker.read_all()
  erb(:"cakes/new")
end

post '/cakes/new' do
  cake = Cake.new params
  cake.save()
  erb(:"cakes/success")
end

get '/cakes/:id' do
  @cakes = Cake.find(params['id'])
  erb(:"cakes/show")
end
