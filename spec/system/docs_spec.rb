RSpec.describe "Docs", type: :system do
  before do
    visit root_path
  end

  it "サイトに関するページ遷移する" do
    click_link "about_service"
    expect(page).to have_content('吃音Q＆A運営について')
  end

  it "利用規約のページ遷移する" do
    click_link 'term_of_use'
    expect(page).to have_content('本サービス利用規約')
  end

  it "プライバシーポリシーのページ遷移する" do
    click_link 'privacy_policy'
    expect(page).to have_content('個人情報の取得')
  end
end
