RSpec.describe "search", type: :system do
  context "仕事と学校のタグが付いた質問がある場合" do
    before do
      create(:question, :work)
      create(:question, :school, :has_answer)
      visit root_path
    end

    it "仕事タグをチェックして検索した場合,仕事タグの質問のみ表示される" do
      check 'work'
      click_button 'search_btn'
      aggregate_failures do
        expect(page).to have_content('test question body and tag is work')
        expect(page).to_not have_content('test question body and tag is school')
      end
    end

    it "学校タグをチェックして検索した場合,学校タグの質問のみ表示される" do
      check 'school'
      click_button 'search_btn'
      aggregate_failures do
        expect(page).to have_content('test question body and tag is school')
        expect(page).to_not have_content('test question body and tag is work')
      end
    end

    it "回答ありをチェックした場合,学校タグの質問が表示される" do
      check 'has_answers'
      click_button 'search_btn'
      aggregate_failures do
        expect(page).to have_content('test question body and tag is school')
        expect(page).to_not have_content('test question body and tag is work')
      end
    end

    it "回答ありをチェックした場合,学校タグの質問が表示される" do
      check 'has_answers'
      click_button 'search_btn'
      aggregate_failures do
        expect(page).to have_content('test question body and tag is school')
        expect(page).to_not have_content('test question body and tag is work')
      end
    end

    it "回答ありをチェックした場合,学校タグの質問が表示される" do
      check 'no_answers'
      click_button 'search_btn'
      aggregate_failures do
        expect(page).to have_content('test question body and tag is work')
        expect(page).to_not have_content('test question body and tag is school')
      end
    end

    it "フォームに'work'と検索した場合、本文にworkが含まれる質問が表示される" do
      fill_in 'keyword', with: 'work'
      click_button 'search_btn'
      aggregate_failures do
        expect(page).to have_content('test question body and tag is work')
        expect(page).to_not have_content('test question body and tag is school')
      end
    end

    it "フォームに'school'と検索した場合、本文にschoolが含まれる質問が表示される" do
      fill_in 'keyword', with: 'school'
      click_button 'search_btn'
      aggregate_failures do
        expect(page).to have_content('test question body and tag is school')
        expect(page).to_not have_content('test question body and tag is work')
      end
    end

    it "フォームに'xxxx'と検索した場合、質問は無い" do
      fill_in 'keyword', with: 'xxx'
      click_button 'search_btn'
      expect(page).to have_content('質問がありません')
    end
  end
end
