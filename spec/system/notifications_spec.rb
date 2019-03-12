RSpec.describe "Notifications", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:question) { create(:question, user: user) }
  let(:answer) { create(:answer, question: question, user: other_user) }
  let(:notification) { create(:notification, user: user, question: question, notified_by: other_user) }

  before do
    answer
    notification
  end

  it '通知を確認する' do
    sign_in_as(user)
    click_link "#{other_user.name}さんがあなたの質問に回答をしました"
    expect(page).to have_content("#{other_user.name} さんの回答内容")
  end
end
