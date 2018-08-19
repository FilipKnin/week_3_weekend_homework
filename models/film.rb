require_relative('../db/sql_runner')

class Film

  attr_accessor(:title)
  attr_reader(:id)

  def initialize(options)
    @title = options['title']
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO films
          (title) VALUES ($1) RETURNING id"
    values = [@title]
    output = SqlRunner.run(sql, values).first #what i get know?/stepbystep
    @id = output['id'].to_i()
  end

  def Film.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def Film.all()
    sql = "SELECT * FROM films"
    result = SqlRunner.run(sql)
    return result.map { |film| Film.new(film)  }
  end

end
