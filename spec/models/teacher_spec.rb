require 'rails_helper'

RSpec.describe Teacher, type: :model do
  let(:teacher) { create(:teacher) }

  it 'ファクトリーが有効であること' do
    expect(teacher).to be_valid
  end
end
