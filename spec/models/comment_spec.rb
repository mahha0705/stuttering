RSpec.describe Comment, type: :model do
  specify { is_expected.to validate_presence_of :body }

  specify { should belong_to(:user) }
  specify { should belong_to(:answer) }
end
