RSpec.describe "VisitHomes", type: :system do
  it "'質問してみる'ボタンがある" do
    visit root_path
    page.has_button?('質問してみる')
  end
end
