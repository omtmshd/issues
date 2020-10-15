require 'rails_helper'

RSpec.describe Subject, type: :model do

  it 'ファクトリーが有効であること' do
    subject = create(:subject, :with_lectures, lectures_count: 5)
    expect(subject).to be_valid
  end
end
