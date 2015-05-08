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
end
