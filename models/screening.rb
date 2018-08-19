class Screening
  attr_accessor(:capacity, :customer_id, :film_id, :screening_time)
  attr_reader(:id)


  def initialize(options)
    @capacity = options['capacity']
    @tickets = []
    @screning_time = options['screning_time']
    @film_id = options['film_id']  
  end
end
