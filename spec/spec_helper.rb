require("rspec")
require("pg")
require("stylist")

DB = PG.connect({:dbname => "salon_system_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylsts *;")
    DB.exec("DELETE FROM clients *;")
  end
end
