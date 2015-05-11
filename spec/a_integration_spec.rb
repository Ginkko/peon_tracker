require('capybara/rspec')
require('./app')
require "spec_helper"

Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe("the employee list path", :type => :feature) do
  it("allows the user to see a list of all employees in the database") do
      Employee.create(name: "Harry")
      visit('/')
      click_link("List of Employees")
      expect(page).to have_content("Harry")
  end
end

describe("the division list path", :type => :feature) do
  it("allows the user to see a list of all divisions in the database") do
    Division.create(name: "R&D")
    visit('/')
    click_link("List of Divisions")
    expect(page).to have_content("R&D")
  end
end