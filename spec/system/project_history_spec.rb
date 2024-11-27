require "rails_helper"

feature "project conversation history" do
  it "lists comments and status transitions in order of recency" do
    project = create(:project, name: "My first project")

    visit project_path(project)

    fill_in "Comment", with: "This is my first comment"
    click_on "Add comment"

    expect(page).to have_content("This is my first comment")
  end

  it "updates the history when the project status changes" do

  end

  it "shows the status changes in the project conversation history" do

  end
end
