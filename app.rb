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


post("/client") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end

get("/clients/:id") do
  @clients = Client.find(params.fetch("id").to_i())
  erb(:client)
end

get("/clients/:id/edit") do
  @clients = Client.find(params.fetch(:id).to_i())
  erb(:client_edit)
end

post("/stylists") do
  stylist_name = params.fetch("stylist_name")
  client_id = params.fetch("client_id").to_i()
  stylist = Stylist.new({:stylist_name => stylist_name, :client_id})
  stylist.save()
  erb(:success)
end
