RSpec.describe "QuestionComments", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in_as(user)
    click_link "質問してみる"
  end

  it "質問を投稿する" do
    fill_in 'タイトル', with: 'test title'
    fill_in '質問内容', with: 'test body'
    check '学校'

    click_button "相談する"
    expect(page).to have_content("投稿完了しました")
    click_link 'test title'
    expect(page).to have_content("test body")
  end

  it "質問を投稿を失敗する" do
    fill_in 'タイトル', with: 'test title'
    fill_in '質問内容', with: ''
    check '学校'

    click_button "相談する"
    expect(page).to have_content("本文が入力されていません。")
  end
end
