RSpec.describe "Answers", type: :system do
  let(:user) { create(:user) }
  let(:question) { create(:question) }
  let(:answer) { create(:answer, question: question) }

  before do
    answer
    sign_in_as(user)
    click_link question.title
    expect(page).to have_content(question.body)
  end

  it "コメントをする" do
    fill_in 'comment_body', with: "added comments"
    click_button 'コメント'
    expect(page).to have_content("投稿完了しました")
    expect(page).to have_content("added comments")
  end

  it "コメントを失敗する" do
    fill_in 'comment_body', with: ""
    click_button 'コメント'
    expect(page).to have_content("処理できません")
  end
end
