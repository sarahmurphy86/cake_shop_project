require_relative "../models/cake.rb"
require_relative "../models/baker.rb"

Baker.delete_all()

baker1 = Baker.new ({
  "name" => "Mary Berry"
  })

baker2 = Baker.new ({
  "name" => "Paul Hollywood"
  })

  baker1.save()
  baker2.save()

cake1 = Cake.new ({
  "name" => "Lemon Drizzle",
  "description" => "Delicious lemon sponge soaked in zesty lemon sugar",
  "quantity" => "10",
  "buying_cost" => "5",
  "retail_price" => "8",
  "baker_id" => baker1.id
  })

cake2 = Cake.new ({
  "name" => "Chocolate",
  "description" => "Tasty chocolate sponge covered in a thick dark chocolate icing",
  "quantity" => "3",
  "buying_cost" => "8",
  "retail_price" => "10",
  "baker_id" => baker2.id
  })

  cake1.save()
  cake2.save()
