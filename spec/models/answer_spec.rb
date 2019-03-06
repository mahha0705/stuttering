RSpec.describe Answer, type: :model do
  specify { is_expected.to validate_presence_of :title }
  specify { is_expected.to validate_presence_of :body }

  specify { should belong_to(:user) }
  specify { should belong_to(:question) }
  specify { should have_many(:comments).dependent(:destroy) }
end
