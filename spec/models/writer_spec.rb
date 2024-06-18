require 'rails_helper'

RSpec.describe Writer, type: :model do
  # Writerのリレーションテスト
  it { is_expected.to have_many(:blogs) }
  # enumのテスト
  it { is_expected.to define_enum_for(:genre).with_values(fiction: 0, non_fiction: 1, poetry: 2) }
end