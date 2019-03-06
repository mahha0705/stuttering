# frozen_string_literal: true

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
  specify { is_expected.to validate_presence_of :title }
  specify { is_expected.to validate_presence_of :body }

  specify { is_expected.to belong_to(:user) }
  specify { is_expected.to have_many(:answers).dependent(:destroy) }
  specify { is_expected.to have_many(:questionTags).dependent(:destroy) }
  specify { is_expected.to have_many(:questionComments).dependent(:destroy) }
  specify { is_expected.to have_many(:notifications).dependent(:destroy) }

  specify { is_expected.to accept_nested_attributes_for(:questionTags) }

  describe '.validate :require_any_question_tags ' do
    let(:user) { create(:user) }
    let(:question) { Question.new(attribute) }
    let(:attribute) { { user: user, title: 'title', body: 'body', questionTags: questionTags } }
    context 'questionTagsが存在する場合' do
      let(:questionTags) { [build(:questionTag)] }
      specify { expect(question).to be_valid }
    end

    context 'questionTagsが無い場合' do
      let(:questionTags) { [] }
      specify { expect(question).to_not be_valid }
    end
  end
end
