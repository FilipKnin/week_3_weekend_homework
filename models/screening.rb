class Screening
  attr_accessor(:capacity, :tickets, :film_id, :projection)
  attr_reader(:id)


  def initialize(options)
    @film_id = options['film_id'].to_i()
    @capacity = options['capacity'].to_i
    @projection = options['projection']
    @tickets = []
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

end
