RSpec.describe "Users", type: :system do
  let(:user) { create(:user, :men, :teen, :has_stuttering) }

  before do
    sign_in_as(user)
    click_link 'マイページ'
    expect(page).to have_content("#{user.name} さん")
    click_link 'user-edit-btn'
    expect(page).to have_content("編集フォーム")
  end

  it "ユーザー情報を変更する" do
    select '女性', from: '性別'
    select '20代前半', from: '年齢'
    select '当事者ではない', from: '吃音に関して'
    fill_in '自己紹介', with: "よろしくお願いいたします。"
    click_button '更新'
    expect(page).to have_content "女性"
    expect(page).to have_content "20代前半"
    expect(page).to have_content "当事者ではない"
    expect(page).to have_content "よろしくお願いいたします。"
  end

  it "ユーザー情報の更新を失敗する" do
    fill_in 'ニックネーム', with: ''
    click_button '更新'
    expect(page).to have_content "名前が入力されていません"
  end

  context "ユーザーが質問している場合" do
    let(:question) { create(:question, user: user) }

    before do
      question
    end

    it "マイページに質問一覧が表示される" do
      click_link 'マイページ'
      click_link question.title
      expect(page).to have_content question.body
    end
  end
end
