RSpec.describe "Answers", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:question) { create(:question, user: other_user) }

  before do
    question
  end

  context "質問したユーザー以外がログインしている場合" do
    before do
      sign_in_as(user)
      click_link question.title
      expect(page).to have_content(question.body)
      expect(page).to have_content("回答フォーム")
    end

    it "回答をする" do
      fill_in 'タイトル', with: 'answer title'
      fill_in '回答内容', with: 'answer body'
      click_button "回答する"
      expect(page).to have_content("投稿完了しました")
    end

    it "回答を失敗する" do
      fill_in 'タイトル', with: 'answer title'
      fill_in '回答内容', with: ''
      click_button "回答する"
      expect(page).to have_content("処理できません")
    end
  end

  context "質問したユーザーがログインしている場合" do
    before do
      sign_in_as(other_user)
      click_link question.title
    end

    it "回答をできない" do
      expect(page).to_not have_content("回答フォーム")
    end
  end
end
