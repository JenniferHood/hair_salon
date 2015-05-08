require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
require('pg')

DB. = PG.connect({:dbname => 'salon_system'})

get('/') do
  @stylist = Stylist.all()
  erb(:index)
end

post('/stylists') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name})
  stylist.save()
  erb(:success)
end
