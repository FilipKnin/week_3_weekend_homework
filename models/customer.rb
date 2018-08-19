class Customer

  attr_accessor(:name, :funds)
  attr_reader(:id)

  def initialize (options)
    @name = options['name']
    @funds = options['funds']
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO films
          (title, name) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    output = SqlRunner.run(sql, values).first #what i get know?/stepbystep
    @id = output['id'].to_i()
  end
end
