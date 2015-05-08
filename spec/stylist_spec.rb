require("rspec")
require("pg")
require("stylist")

DB = PG.connect({:dbname => "salon_system_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylsts *;")
  end
end

describe(Stylist) do

  describe(".all")do
    it("is empty at first") do
    expect(Stylist.all()).to(eq([]))
    end
  end


  describe("#name") do
    it("gives you a name of a stylist") do
      test_stylist = Stylist.new("Monica")
      expect(test_stylist.name()).to(eq("Monica"))
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
