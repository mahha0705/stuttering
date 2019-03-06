# == Schema Information
#
# Table name: questions
#
#  id            :bigint(8)        not null, primary key
#  user_id       :bigint(8)        not null
#  title         :string           not null
#  body          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  answers_count :integer          default(0), not null
#

RSpec.describe Question, type: :model do
  let(:user) { create(:user) }
  it "user_id, title, bodyがあればquestionは有効になる" do
    question = Question.new(
      user_id: user.id,
      title: "test",
      body: "test body",
      questionTags_attributes: { "0": { tag: "school" } }
    )
    expect(question).to be_valid
  end

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }
end
