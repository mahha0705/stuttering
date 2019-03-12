RSpec.describe "search", type: :system do
  before do
    visit root_path
  end

  context "仕事と学校のタグが付いた質問がある場合" do
    let(:question_about_work) { create(:question, :work) }
    let(:question_about_school) { create(:question, :school) }

    before do
      question_about_work
      question_about_school
    end

    it "仕事タグをチェックして検索した場合,仕事タグの質問のみ表示される" do
      check 'work'
      click_button 'search_btn'
      expect(page).to have_content(question_about_work.body)
      expect(page).to_not have_content(question_about_school.body)
    end

    it "学校タグをチェックして検索した場合,学校タグの質問のみ表示される" do
      check 'school'
      click_button 'search_btn'
      expect(page).to have_content(question_about_school.body)
      expect(page).to_not have_content(question_about_work.body)
    end
  end

  context "回答のある質問、回答の無い質問がある場合" do
    let(:question_about_work) { create(:question, :work) }
    let(:question_about_school_with_answer) { create(:question, :has_answer, :school) }

    before do
      question_about_work
      question_about_school_with_answer
    end

    it "回答ありをチェックした場合,回答ありの質問が表示される" do
      check 'has_answers'
      click_button 'search_btn'
      expect(page).to have_content(question_about_school_with_answer.body)
      expect(page).to_not have_content(question_about_work.body)
    end

    it "回答なしをチェックした場合,回答がない質問が表示される" do
      check 'no_answers'
      click_button 'search_btn'
      expect(page).to have_content(question_about_work.body)
      expect(page).to_not have_content(question_about_school_with_answer.body)
    end
  end

  context "本文にworkが含まれる質問、schoolが含まれる質問がそれぞれある場合" do
    let(:question_about_work) { create(:question, :work) }
    let(:question_about_school) { create(:question, :school) }

    before do
      question_about_work
      question_about_school
    end

    it "フォームに'work'と検索した場合、本文にworkが含まれる質問が表示される" do
      fill_in 'keyword', with: 'work'
      click_button 'search_btn'
      expect(page).to have_content(question_about_work.body)
      expect(page).to_not have_content(question_about_school.body)
    end

    it "フォームに'school'と検索した場合、本文にschoolが含まれる質問が表示される" do
      fill_in 'keyword', with: 'school'
      click_button 'search_btn'
      expect(page).to have_content(question_about_school.body)
      expect(page).to_not have_content(question_about_work.body)
    end

    it "フォームに'xxxx'と検索した場合、質問は無い" do
      fill_in 'keyword', with: 'xxx'
      click_button 'search_btn'
      expect(page).to have_content('質問がありません')
    end
  end
end
