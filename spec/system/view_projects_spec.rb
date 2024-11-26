require "rails_helper"

feature "viewing all projects" do
  it "shows a list of project" do
    create(:project, name: "My first project")
    create(:project, name: "My second project")

    visit "/"

    expect(page).to have_content "My first project"
    expect(page).to have_content "My second project"
  end

  it "allows the user to view a project" do
    create(:project, name: "My first project", status: :complete)

    visit "/"

    click_on "My first project"

    expect(page).to have_content "My first project"
    expect(page).to have_content "Complete"
  end
end
