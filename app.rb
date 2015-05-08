require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('.lib/client')
require('pg')

DB. = PG.connect({:dbname => 'salon_system'})

get('/') do
  @stylist = Stylist.all()
  erb(:index)
end

get('/clients/new') do
  erb(:client_form)
end

post("/client") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end
