require_relative "../models/cake.rb"
require_relative "../models/baker.rb"
require_relative "../models/cake_type.rb"

require( 'pry-byebug' )

Cake.delete_all()
Baker.delete_all()

baker1 = Baker.new ({
  "name" => "Mary Berry"
  })

baker2 = Baker.new ({
  "name" => "Paul Hollywood"
  })

  baker1.save()
  baker2.save()

cake_type1 = Cake_type.new ({
  "type" => "Classic Sponge"
  })

cake_type2 = Cake_type.new ({
  "type" => "Wedding Cake"
  })

cake_type3 = Cake_type.new ({
  "type" => "Birthday Cake"
  })

cake_type4 = Cake_type.new ({
  "type" => "Cup Cake"
  })

  cake_type1.save()
  cake_type2.save()
  cake_type3.save()
  cake_type4.save()

cake1 = Cake.new ({
  "name" => "Lemon Drizzle",
  "description" => "Delicious lemon sponge soaked in zesty lemon sugar",
  "quantity" => "10",
  "buying_cost" => "5",
  "retail_price" => "8",
  "baker_id" => baker1.id,
  "cake_type_id" => cake_type1.id
  })

cake2 = Cake.new ({
  "name" => "Chocolate",
  "description" => "Tasty chocolate sponge covered in a thick dark chocolate icing",
  "quantity" => "3",
  "buying_cost" => "8",
  "retail_price" => "10",
  "baker_id" => baker2.id,
  "cake_type_id" =>cake_type3.id
  })

  cake1.save()
  cake2.save()

binding.pry
nil
