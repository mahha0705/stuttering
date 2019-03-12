RSpec.describe "SignUp", type: :system do
  it "ユーザー登録をする" do
    visit root_path
    click_link 'メンバー登録'
    fill_in 'ニックネーム', with: 'test'
    fill_in 'Email アドレス', with: 'sa@example.com'
    fill_in 'パスワード(６文字以上)', with: 'testtest'
    fill_in 'パスワード(確認)', with: 'testtest'
    select '男性', from: '性別'
    select '20代後半', from: '年齢層'
    select '当事者', from: '吃音に関して'
    expect { click_button '登録する' }.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content('本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。')
    user = User.last
    token = user.confirmation_token
    visit user_confirmation_path(confirmation_token: token)
    expect(page).to have_content('アカウントを登録しました。')
  end
end
