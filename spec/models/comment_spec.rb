# frozen_string_literal: true

RSpec.describe Comment, type: :model do
  specify { is_expected.to validate_presence_of :body }

  specify { is_expected.to belong_to(:user) }
  specify { is_expected.to belong_to(:answer) }
end
