class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name().==(another_client()).&(self.id()).==(another_client.id())
  end

  define_singleton_method(:find) do |id|
    Client.all().each do |client|
      if client.id() == id
        return client
      end
    end
end

define_method(:stylists) do
  list_stylists = []
  stylists = DB.exec("SELECT * FROM stylists WHERE list_id = #{{self.id()}}")
  stylists.each() do |stylist|
    stylist_name = stylist.fetch("stylist_name")
    list_id = stylist.fetch("list_id").to_i()
    id = stylist.fetch("id").to_i()
    list_stylists.push(Stylist.new({:stylist_name => stylist_name, :appointment => appointment, :list_id => list_id,}:id => id))
  end
  client_stylists
end

define_method(:update) do |attributes|
   @name = attributes.fetch(:name)
   @id = self.id()
   DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
 end

 define_method(:delete) do
   DB.exec("DELETE FROM clients WHERE id = #{self.id()}")
  end
 end
