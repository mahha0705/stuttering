RSpec.describe "VisitHomes", type: :system do
  scenario "visit home page" do
    visit root_path
    expect(page).to have_content("質問してみる")
  end
end
