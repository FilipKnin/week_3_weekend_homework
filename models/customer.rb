class Customer

  attr_accessor(:name, :funds)
  attr_reader(:id)

  def initialize (options)
    @name = options['name']
    @funds = options['funds'].to_i()
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO customers
          (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    output = SqlRunner.run(sql, values).first #what i get know?/stepbystep
    @id = output['id'].to_i()
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def Customer.all()
    sql = "SELECT * FROM customers"
    result = SqlRunner.run(sql)
    return result.map { |customer| Customer.new(customer)  }
  end

  def update()
    sql = "UPDATE customers
          SET
          (
          name, funds
          )
          =
          (
          $1, $2)
          WHERE
          id = $3"
      values = [@name, @funds, @id]
      result = SqlRunner.run(sql, values)
      return result.map { |customer| Customer.new(customer)  }
  end

  # def all_films()
  #   sql = "SELECT films.*
  #         FROM films
  #         INNER JOIN screenings
  #         ON screening.film_id = films.id
  #         WHERE  "
  #
  # end

  # "SELECT stars.*
  #         FROM stars
  #         INNER JOIN castings
  #         ON castings.star_id = stars.id
  #         WHERE castings.movie_id = $1"

end
