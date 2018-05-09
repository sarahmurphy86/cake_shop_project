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

end
