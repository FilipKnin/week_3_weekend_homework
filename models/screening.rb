class Screening
  attr_accessor(:capacity, :tickets, :film_id, :projection)
  attr_reader(:id)


  def initialize(options)
    @film_id = options['film_id'].to_i()
    @capacity = options['capacity'].to_i
    @projection = options['projection']
    @tickets = []
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO screenings
          (film_id, capacity, projection)
          VALUES
          ($1, $2, $3)
          RETURNING id"
    values = [@film_id, @capacity, @projection]
    output = SqlRunner.run(sql, values).first #what i get know?/stepbystep
    @id = output['id'].to_i()
  end

  def Screening.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def Screening.all()
    sql = "SELECT * FROM screenings"
    result = SqlRunner.run(sql)
    return result.map { |screening| Screening.new(screening)  }
  end

  def update()
    sql = "UPDATE screenings
          SET
          (
          film_id, capacity, projection
          )
          =
          (
          $1, $2, $3)
          WHERE
          id = $4"
      values = [@film_id, @capacity, @projection, @id]
      result = SqlRunner.run(sql, values)
      return result.map { |screening| Screening.new(screening)  }
  end

end
