require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry')

film1 = Film.new({
  'title' => 'The Force Awakens'
  });

film2 = Film.new({
  'title' => 'Indiana Jones'
  });

film1.save()
film2.save()

customer1 = Customer.new({
  'name' => 'Filip Kuszenin',
  'funds' => '250'
  });

customer2 = Customer.new({
  'name' => 'Johny Bravo',
  'funds' => '300'
  });

customer1.save()
customer2.save()

screening1 = Screening.new({
  'film_id' => film1.id,
  'capacity' => '2',
  'projection' => '15:30'
  });

screening2 = Screening.new({
  'film_id' => film2.id,
  'capacity' => '1',
  'projection' => '18:30'
  });

screening1.save()
screening2.save()

binding.pry
nil
