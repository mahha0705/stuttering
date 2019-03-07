RSpec.describe "VisitHomes", type: :system do
  it "'質問してみる'ボタンがある" do
    visit root_path
    # expect(page).to have_button?('質問してみる')
    expect(page).to have_link '質問してみる', href: new_user_registration_path
  end
end
