RSpec.describe "QuestionComments", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:question) { create(:question, user: user) }

  before do
    question
  end

  context "自身が質問をしている場合" do
    before do
      sign_in_as(user)
      visit root_path
      click_link question.title
      expect(page).to have_content(question.body)
    end

    it "追記コメントをする" do
      fill_in 'question_comment_body', with: 'added comments'
      click_button '追記する'
      expect(page).to have_content("投稿完了しました")
      expect(page).to have_content("added comments")
    end

    it "追記コメントを失敗する" do
      fill_in 'question_comment_body', with: ''
      click_button '追記する'
      expect(page).to have_content("処理できません")
    end
  end

  context "自身の質問では無い場合" do
    before do
      sign_in_as(other_user)
      visit root_path
      click_link question.title
    end

    it '投稿できない' do
      expect(page).to_not have_button '追記する'
    end
  end
end
