# frozen_string_literal: true

RSpec.describe QuestionComment, type: :model do
  specify { is_expected.to validate_presence_of :body }
  specify { is_expected.to belong_to(:question) }
end
