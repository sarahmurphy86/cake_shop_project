require_relative "../db/sql_runner"

class Cake

  attr_reader :id, :name, :description, :quantity, :buying_cost, :retail_price, :baker_id

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
    sql = "INSERT INTO cakes (name, description, quantity, buying_cost, retail_price, baker_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @description, @quantity, @buying_cost, @retail_price, @baker_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

# DELETE METHOD - Class
  def self.delete_all()
    sql = "DELETE FROM cakes"
    SqlRunner.run(sql)
  end

end
