require("rspec")
require("Stylist")

describe(Stylist) do
    describe("#name") do
      it("gives you a name of a stylist") do
      test_stylist = Stylist.new("Monica")
      expect(test_stylist.name()).to(eq("Monica"))
    end
  end

  describe(".all")do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a stylist to the array of saved stylists") do
      test_stylist = Stylist.new("Evelyn")
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved stylists") do
      Stylist.new("Monica").save()
      Stylist.clear()
      expect(Stylist.all()).to(eq([]))
    end
  end
end
