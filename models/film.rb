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

  def update()
    sql = "UPDATE films
          SET
          title
          =
          $1
          WHERE
          id = $2"
      values = [@title, @id]
      result = SqlRunner.run(sql, values)
      return result.map { |film| Film.new(film)  }
  end






  def all_customers()
      sql = "SELECT customers.*
            FROM customers
            INNER JOIN tickets
            ON tickets.customer_id = customers.id
            INNER JOIN screenings
            ON screenings.film_id = films.id
            WHERE screenings.film_id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return result.map { |customer| Customer.new(customer)  }
  end

  #
  #
  #
  #

end
