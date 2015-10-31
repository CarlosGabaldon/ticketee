require "rails_helper"

RSpec.feature "Users can view projects" do
  before do
    @project_name = "Sublime Text 3"
  end
  scenario "with the project details" do
    project = FactoryGirl.create(:project, name: @project_name)

    visit "/"
    click_link @project_name
    expect(page.current_url).to eq project_url(project)
  end
end
