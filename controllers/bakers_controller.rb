require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/cake.rb')
require_relative('../models/baker.rb')

get '/bakers' do
  @bakers = Baker.read_all()
  erb(:"bakers/index")
end

get '/bakers/new' do
  @bakers = Baker.read_all()
  erb(:"bakers/new")
end

post '/bakers/new' do
  baker = Baker.new params
  baker.save()
  erb(:"bakers/success_add_baker")
end

get '/bakers/:id' do
  @baker = Baker.find(params['id'])
  erb(:"bakers/show")
end

get '/bakers/:id/edit' do
  @baker = Baker.find(params['id'])
  erb(:"bakers/edit")
end

post '/bakers/:id' do
  baker = Baker.new(params)
  baker.update()
  erb(:"bakers/success_baker_updated")
end

post '/bakers/:id/delete' do
  #if baker has any cakes
  # redirect to a new page saying sorry
  #else
  # if Baker.get_cake.quantity >= 1
  #   erb(:"bakers/sorry_baker_has_cakes")
  # else
  baker = Baker.find(params['id'])
  baker.delete()
  erb(:"bakers/success_baker_deleted")
  
end
