require("spec_helper")

describe("client") do
  describe(".all")do
    it ("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you clients name") do
      client = Client.new({:name => "Josie", :id => nil})
      expect(client.name()).to(eq("Josie"))
    end
  end

  describe("#id") do
    it("sets the clients ID when you save it") do
      client = Client.new(:name)
    end
  end

  describe("save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Kairi", :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it("is the same client if it's the same name") do
      client1 = Client.new({:name => "Kairi", :id => nil})
      client2 = Client.new({:name => "Kairi", :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe(".find") do
    it("returns a client by its ID") do
      test_client = Client.new({:name => "Jocelyn", :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Joy", :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#stylists") do
    it("returns a stylist assigned for that client") do
      test_client = Client.new({:name => "Jocelyn", :id => nil})
      test_client.save()
      test_stylist = Stylist.new({:stylist_name => "Monica", :list_id => test_client.id()})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist_name => "Jared", :list_id => test_client.id()})
      test_client2.save()
      expect(test_client.stylist()).to(eq([test_stylist, test_stylist2]))
    end
  end
end
