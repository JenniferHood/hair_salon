require("spec_helper")

describe(Stylist) do
  describe(".all")do
    it("is empty at first") do
    expect(Stylist.all()).to(eq([]))
    end
  end

    describe("#save") do
      it("saves a stylists nametot he array of saved stylists") do
        test_stylist = Stylist.new({:name => "Evelyn"})
        test_stylist.save()
        expect(Stylist.all()).to(eq([test_stylist]))
      end
    end


  describe("#name") do
    it("gives you a name of a stylist") do
      test_stylist = Stylist.new("Monica")
      expect(test_stylist.name()).to(eq("Monica"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_client = Client.new({:name => "Kairi", :client_id => 1})
      expect(test_client.client_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same stylist if the stylist has the same name") do
      stylist1 = Stylist.new({:name => "Evelyn"})
      stylist2 = Stylist.new({:name => "Evelyn"})
      expect(task1).to(eq(task2))
    end
  end
end
