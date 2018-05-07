require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/bakers_controller')
require_relative('controllers/cakes_controller')

get '/' do
  @cakes = Cake.read_all()
  @bakers = Baker.read_all()
  erb(:inventory)
end
