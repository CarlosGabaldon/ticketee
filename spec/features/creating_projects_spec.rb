require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    project_name = "Sublime Text 3"
    visit "/"

    click_link "New Project"

    fill_in "Name", with: project_name
    fill_in "Description", with: "A text editor for everyone"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by(name: project_name)
    expect(page.current_url).to eq project_url(project)

    title = "#{project_name} - Projects - Ticketee"
    expect(page).to have_title title
  end
end
