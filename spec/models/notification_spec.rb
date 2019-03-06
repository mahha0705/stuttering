require 'rails_helper'

RSpec.describe Notification, type: :model do
  specify { is_expected.to belong_to(:user) }
  specify { is_expected.to belong_to(:notified_by).class_name('User') }
  specify { is_expected.to belong_to(:question) }
end
