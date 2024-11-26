require "rails_helper"

feature "creating projects" do
  scenario "valid inputs" do
    visit "/"
    click_link "New project"

    fill_in "Name", with: "My first project"
    select "In progress", from: "Status"
    click_on "Create"

    expect(page).to have_content("My first project")
    expect(page).to have_content("In progress")
  end

  scenario "invalid inputs" do
    visit "/"
    click_link "New project"

    fill_in "Name", with: ""
    click_on "Create"

    expect(page).to have_content("Name can't be blank")
  end
end
