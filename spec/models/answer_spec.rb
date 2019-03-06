RSpec.describe Answer, type: :model do
  specify { is_expected.to validate_presence_of :title }
  specify { is_expected.to validate_presence_of :body }

  specify { is_expected.to belong_to(:user) }
  specify { is_expected.to belong_to(:question) }
  specify { is_expected.to have_many(:comments).dependent(:destroy) }
end
