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
    @quantity = options["quantity"].to_i
    @buying_cost = options["buying_cost"]
    @retail_price = options["retail_price"]
    @baker_id = options["baker_id"].to_i
  end

# CREATE METHOD - Instance
  def save()
    sql = "INSERT INTO cakes
    (name, description, quantity, buying_cost, retail_price, baker_id)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @description, @quantity, @buying_cost, @retail_price, @baker_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

# UPDATE METHOD - Instance
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

# Method for a Stock Level
# If quantity is greater or equal to 6 then return green
# If quantity is equal to 5 return amber
# Otherwise return red
  # def stock_level()
  #   if @quantity >= "6"
  #     return "green"
  #   elsif @quantity == "5"
  #     return "amber"
  #   else @quantity
  #     return "red"
  #   end
  # end

  # Method for Stock Level
  def stock_level()
  # If quantity is greater than 8 return green
  # If quantity is greater than 3 and quantity is less than or equal to 7 return amber
  # Otherwise return red
    if @quantity >= 8
      return "green"
    elsif @quantity >=3 && @quantity <=7
      return "amber"
    else
      return "red"
    end
  end
end
