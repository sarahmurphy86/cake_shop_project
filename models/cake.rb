require_relative "../db/sql_runner"
require_relative "baker.rb"
require('pry-byebug')

class Cake

  attr_reader :id
  attr_accessor :name, :description, :quantity, :buying_cost, :retail_price, :baker_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @description = options["description"]
    @quantity = options["quantity"]
    @buying_cost = options["buying_cost"]
    @retail_price = options["retail_price"]
    @baker_id = options["baker_id"].to_i
  end

# CREATE METHOD - Individual
  def save()
    sql = "INSERT INTO cakes
    (name, description, quantity, buying_cost, retail_price, baker_id)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @description, @quantity, @buying_cost, @retail_price, @baker_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

# READ METHOD - Class
  def self.read_all()
    sql = "SELECT * FROM cakes"
    result = SqlRunner.run(sql)
    build_results(result)
  end

# FIND METHOD - Class
  def self.find(id)
    sql = "SELECT * FROM cakes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values)[0]
    cake = Cake.new(result)
    return cake
  end

# UPDATE METHOD - Individual
  def update()
    sql = "UPDATE cakes SET
    (name, description, quantity, buying_cost, retail_price, baker_id)
    =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @description, @quantity, @buying_cost, @retail_price, @baker_id, @id]
    SqlRunner.run(sql, values)
  end

# DELETE METHOD - Instance
  def delete()
    sql = "DELETE FROM cakes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

# DELETE METHOD - Class
  def self.delete_all()
    sql = "DELETE FROM cakes"
    SqlRunner.run(sql)
  end

# MAP METHOD - To use in READ and UPDATE Method
  def self.build_results(results)
    result = results.map{|cake| Cake.new(cake)}
    return result
  end

# Get baker method - to use to display in view
  def get_baker()
    baker = Baker.find(@baker_id)
    return baker
  end

end
