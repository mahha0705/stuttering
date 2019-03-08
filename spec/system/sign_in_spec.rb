RSpec.describe "SignIn", type: :system do
  let(:user) { create(:user) }

  before do
    token = user.confirmation_token
    visit user_confirmation_path(confirmation_token: token)
    click_link 'ログアウト'
  end

  it "サインインする" do
    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
    expect(page).to have_content('ログインしました。')
  end
end
