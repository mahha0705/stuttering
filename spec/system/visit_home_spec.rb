RSpec.describe "VisitHomes", type: :system do
  it "'質問してみる'ボタンがある" do
    visit root_path
    expect(page).to have_link('質問してみる', href: new_user_registration_path)
  end

  context "質問がある場合" do
    before do
      create(:question, :school)
    end

    it "質問本文がある" do
      visit root_path
      expect(page).to have_content('test question body and tag is school')
    end
  end

  context "質問のタグが仕事の場合" do
    before do
      create(:question, :work)
    end

    it "仕事タグをクリックしたら質問がある" do
      visit root_path
      click_link '仕事'
      expect(page).to have_content('test question body and tag is work')
    end

    it "学校タグをクリックしたら質問が無い" do
      visit root_path
      click_link '学校'
      expect(page).to have_content('質問がありません')
    end
  end
end
