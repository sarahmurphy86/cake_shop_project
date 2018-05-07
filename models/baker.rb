require_relative "../db/sql_runner"

class Baker

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

# CREATE METHOD - Individual
  def save()
    sql = "INSERT INTO bakers (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

# READ METHOD - Class
  def self.read_all()
    sql = "SELECT * FROM bakers"
    result = SqlRunner.run(sql)
    build_results(result)
  end

# UPDATE METHOD - Individual

# DELETE METHOD - Class
  def self.delete_all()
    sql = "DELETE FROM bakers"
    SqlRunner.run(sql)
  end

# FIND METHOD - Individual

# MAP METHOD - To use in READ and UPDATE Method
  def self.build_results(results)
    result = results.map{|baker| Baker.new(baker)}
    return result
  end

end



#Helper method for mapping
def self.map_items(customer_data)
  result = customer_data.map { |customer| Customer.new( customer ) }
  return result
end
