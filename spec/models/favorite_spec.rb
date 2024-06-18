require 'rails_helper'

RSpec.describe Favorite, type: :model do
  # Favoriteのリレーションテスト
  it { is_expected.to belong_to(:writer) }
  it { is_expected.to belong_to(:blog) }
end