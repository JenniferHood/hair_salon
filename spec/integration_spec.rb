require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
Set(:show_exceptions, false)

  describe("adding a new client", {:type => feature}) do
    it("allows a user to click a client to see which stylist the client is suppose to see") do
    visit("/")
    click_link("Add New CLient")
    fill_in("name", :with => "Jocelyn")
    click_button("Add Client")
    expect(page).to have_content("Success!")
  end
end

describe("viewing all of the clients", {:type => :feature}) do
  it("allows a user to see all of the clients that has been added") do
    client = Client.new({:name => "Jocelyn"})
    client.save()
    visit("/")
    click_link("View All Clients")
    expect(page).to have_content(client.name)
  end
end

describe("seeing the stylist assigned to the client", {:type => :feature}) do
  it("allows a user to click on the client to see the assigned stylist") do
    test_client = Client.new({:name => "Joy"})
    test_client.save()
    test_stylist = Stylist.new({:stylist_name => "Joanne", :list_id => test_client.id()})
    test_stylist_name.save()
    visit("/")
    click_link(test_client.name())
    expect(page).to have_content(test_take.stylist_name())
  end
end


describe("adding a stylist to a client", {:type => :feature}) do
  it("allows a user to assign a stylist to a client") do
    test_client = Client.new({:name => "Kairi"})
    test_client.save()
    visit("/clients/#{test_client.id()}")
    fill_in("stylist_name", {:with => "Monica"})
    click_button("Assign Stylist")
    expect(page).to have_content("Success")
  end
end
