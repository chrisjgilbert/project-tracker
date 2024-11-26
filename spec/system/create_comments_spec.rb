require "rails_helper"

feature "adding comments to projects" do
  scenario "valid inputs" do
    project = create(:project, name: "My first project")

    visit project_path(project)

    fill_in "Comment", with: "This is my first comment"
    click_on "Add comment"

    expect(page).to have_content("This is my first comment")
  end

  scenario "empty comment" do
    project = create(:project, name: "My first project")

    visit project_path(project)

    fill_in "Comment", with: ""
    click_on "Add comment"

    expect(page).to have_content("Content can't be blank")
  end
end
