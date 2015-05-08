require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
Set(:show_exceptions, false)

  describe("adding a new client, {:type => feature}") do
    it("allows a user to click a client to see which stylist the client is suppose to see") do
    visit("/")
    click_link("Add New CLient")
    fill_in("name", :with => "Jocelyn")
    click_button("Add Client")
    expect(page).to have_content("Success!")
  end
end
