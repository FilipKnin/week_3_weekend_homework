class Ticket

  attr_accessor(:customer_id, :film_id)
  attr_reader(:id)

  def initialize(options)
    @customer_id = options['customer_id'].to_i()
    @film_id = options['film_id'].to_i()
    @screening_id = options['screening_id'].to_i()
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
