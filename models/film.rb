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

end
