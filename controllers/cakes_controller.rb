require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cake.rb')
require_relative('../models/cake_type.rb')
require_relative('../models/baker.rb')

get '/cakes' do
  @cakes = Cake.read_all()
  @cake_types = Cake_type.read_all()
  erb(:"cakes/index")
end

get '/cakes/new' do
  @cakes = Cake.read_all()
  @bakers = Baker.read_all()
  @cake_types = Cake_type.read_all()
  erb(:"cakes/new")
end

post '/cakes/new' do
  @cake = Cake.new(params)
  @cake.save()
  erb(:"cakes/success_add_cake")
end

get '/cakes/:id' do
  @cake = Cake.find(params['id'])
  erb(:"cakes/show")
end

get '/cakes/:id/edit' do
  @cake = Cake.find(params['id'])
  @bakers = Baker.read_all()
  @cake_types = Cake_type.read_all()
  erb(:"cakes/edit")
end

post '/cakes/:id' do
  cake = Cake.new(params)
  cake.update()
  erb(:"cakes/success_cake_updated")
end

post '/cakes/:id/delete' do
  cake = Cake.find(params['id'])
  cake.delete()
  erb(:"cakes/success_cake_deleted")
end
