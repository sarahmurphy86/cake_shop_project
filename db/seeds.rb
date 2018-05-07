require_relative "../models/baker.rb"

baker1 = Baker.new ({
  "name" => "Mary Berry"
  })

baker2 = Baker.new ({
  "name" => "Paul Hollywood"
  })

  baker1.save()
  baker2.save()
