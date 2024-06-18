require 'rails_helper'

RSpec.describe Blog, type: :model do
  # Blogのリレーションテスト
  it { is_expected.to belong_to(:writer) }
end