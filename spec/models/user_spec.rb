# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  stuttering             :integer          default("has_stuttering")
#  about                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  gender                 :integer          default("male"), not null
#  age                    :integer          default("teens"), not null
#  display_allowed        :boolean          default(TRUE), not null
#

RSpec.describe User, type: :model do
  it "有効なファクトリを持つこと" do
    expect(build(:user)).to be_valid
  end

  it "名前と年齢と性別と吃音の有無があれば、ユーザーが有効になる" do
    user = User.new(
      name: "test",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      age: 0,
      gender: 0,
      stuttering: 0
    )
    expect(user).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to validate_presence_of :age }
  it { is_expected.to validate_presence_of :gender }
  it { is_expected.to validate_presence_of :stuttering }

  it { is_expected.to validate_presence_of :email }
  # it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_confirmation_of :password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
end
