require "rails_helper"

feature "visiting the root" do
  it "renders the projects index" do
    visit "/"

    expect(page).to have_content "Projects#index"
  end
end
