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

  specify { is_expected.to validate_presence_of :name }
  specify { is_expected.to validate_uniqueness_of :name }
  specify { is_expected.to validate_presence_of :age }
  specify { is_expected.to validate_presence_of :gender }
  specify { is_expected.to validate_presence_of :stuttering }

  specify { is_expected.to validate_presence_of :email }
  specify { is_expected.to validate_presence_of :password }
  specify { is_expected.to validate_confirmation_of :password }
  specify { is_expected.to validate_length_of(:password).is_at_least(6) }

  specify { is_expected.to have_many(:questions).dependent(:destroy) }
  specify { is_expected.to have_many(:answers).dependent(:nullify) }
  specify { is_expected.to have_many(:comments).dependent(:nullify) }
  specify { is_expected.to have_many(:notifications).dependent(:destroy) }

  it do
    is_expected.to define_enum_for(:stuttering).with_values(
      has_stuttering: 0,
      no_stuttering: 1,
      stuttering_no_answer: 2
    )
  end

  it do
    is_expected.to define_enum_for(:gender).with_values(
      male: 0,
      female: 1,
      other: 2,
      gender_no_answer: 3
    )
  end

  it do
    is_expected.to define_enum_for(:age).with_values(
      teens: 0,
      early_twenties: 1,
      late_twenties: 2,
      early_thirties: 3,
      late_thirties: 4,
      forties: 5,
      fifties: 6,
      sixties_more: 7,
      age_no_answer: 8
    )
  end
end
