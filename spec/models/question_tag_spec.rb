RSpec.describe QuestionTag, type: :model do
  specify { is_expected.to belong_to(:question) }

  it do
    is_expected.to define_enum_for(:tag).with_values(
      school: 0,
      work: 1,
      job_hunting: 2,
      relationship: 3,
      improvement: 4,
      hospital: 5,
      other: 10
    )
  end
end
