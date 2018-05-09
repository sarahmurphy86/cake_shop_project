require_relative('../db/sql_runner')
require('pry-byebug')

class Cake_type

  attr_reader :id, :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

# CREATE METHOD - Instance
  def save()
    sql = "INSERT INTO cake_types (type) VALUES ($1) RETURNING id"
    values = [@type]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

# READ METHOD - Class
  def self.read_all()
    sql = "SELECT * FROM cake_types"
    result = SqlRunner.run(sql)
    build_results(result)
  end

# DELETE METHOD - Class
  def self.delete_all()
    sql = "DELETE FROM cake_types"
    SqlRunner.run(sql)
  end

# FIND METHOD - Class
  def self.find(id)
    sql = "SELECT * FROM cake_types WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values)[0]
    cake_type = Cake_type.new(result)
    return cake_type
  end

# MAP METHOD- Class - To use in READ Method
  def self.build_results(results)
    result = results.map{|cake_type| Cake_type.new(cake_type)}
    return result
  end

end
