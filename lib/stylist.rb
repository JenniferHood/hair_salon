class Stylist
  attr_reader(:stylist_name, :client_id)

define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @client_id = attributes.fetch(:client_list)
  end

  define_singleton_method(:all) do
    returned_stylsts = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("stylist_name")
      client_id = stylist.fetch("List_id").to_i()
      stylist.push(Stylist.new({:stylist_name => stylist_name, :client_id => client_id}))
    end
    stylist
  end

  define_method(:save) do
    DB.exec("INSERT INTO stylists (name, client_id) VALUES ('#{@stylist_name}', #{@client_id})")
  end
end

  define_method(.==) do |another_stylist|
    self.stylist_name().==(another_stylst.stylist_name())
  end
