require "rails_helper"

feature "adding comments and changing the status of projects" do
  it "shows the status changes and comments in the project conversation history ordered by recency" do
    project = create(:project, name: "My first project", status: :not_started)

    visit project_path(project)

    fill_in "Comment", with: "This is my first comment"
    click_on "Add comment"

    select "In progress", from: "Status"

    fill_in "Comment", with: "This is my second comment"
    click_on "Add comment"

    select "Complete", from: "Status"

    events = all("#events li")
    expect(events[0]).to have_content("In progress to Complete")
    expect(events[1]).to have_content("This is my second comment")
    expect(events[2]).to have_content("Not started to In progress")
    expect(events[3]).to have_content("This is my first comment")
  end
end
