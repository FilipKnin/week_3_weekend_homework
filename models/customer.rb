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
end
