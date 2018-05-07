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
