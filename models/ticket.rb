class Ticket

  attr_accessor(:customer_id, :screening_id, :price)
  attr_reader(:id)

  def initialize(options)

    @customer_id = options['customer_id'].to_i()
    @screening_id = options['screening_id'].to_i()
    @price = options['price'].to_i()
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO tickets
          (customer_id, screening_id, price)
          VALUES
          ($1, $2, $3)
          RETURNING id"
    values = [@customer_id, @screening_id, @price]
    output = SqlRunner.run(sql, values).first #what i get know?/stepbystep
    @id = output['id'].to_i()
  end

  def Ticket.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def Ticket.all()
    sql = "SELECT * FROM tickets"
    result = SqlRunner.run(sql)
    return result.map { |ticket| Ticket.new(ticket)  }
  end

  def update()
    sql = "UPDATE tickets
          SET
          (
          customer_id, screening_id, price
          )
          =
          (
          $1, $2, $3)
          WHERE
          id = $4"
      values = [@customer_id, @screening_id, @price, @id]
      result = SqlRunner.run(sql, values)
      return result.map { |ticket| Ticket.new(ticket)  }
  end

  def customer()
    sql = "SELECT * FROM customers
          WHERE id = $1"
    values = [@customer_id]
    result = SqlRunner.run(sql, values)
    return result.map { |customer| Customer.new(customer)  }
  end

  def screening()
    sql = "SELECT * FROM screenings
          WHERE id = $1"
    values = [@screening_id]
    result = SqlRunner.run(sql, values)
    return result.map { |screening| Screening.new(screening)  }

  end
end
