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

  specify { is_expected.to validate_presence_of :title }
  specify { is_expected.to validate_presence_of :body }

  specify { should belong_to(:user) }
  specify { should have_many(:answers).dependent(:destroy) }
  specify { should have_many(:questionTags).dependent(:destroy) }
  specify { should have_many(:questionComments).dependent(:destroy) }
  specify { should have_many(:notifications).dependent(:destroy) }

  specify { should accept_nested_attributes_for(:questionTags) }
  it "user_id, title, body,questionTags_attributesがあればquestionは有効になる" do
    question = Question.new(
      user_id: user.id,
      title: "test",
      body: "test body",
      questionTags_attributes: { "0": { tag: "school" } }
    )
    expect(question).to be_valid
  end
  it "questionTags_attributesがなければquestionは無効になる" do
    question = Question.new(
      user_id: user.id,
      title: "test",
      body: "test body"
    )
    expect(question).to_not be_valid
  end
end
