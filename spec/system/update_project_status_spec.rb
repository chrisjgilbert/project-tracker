require "rails_helper"

feature "updating the project status" do
  it "shows the status changes in the project conversation history" do
    project = create(:project, name: "My first project", status: :not_started)

    visit project_path(project)

    select "In progress", from: "Status"

    expect(page).to have_content("Status changed from Not started to In progress")
  end
end
