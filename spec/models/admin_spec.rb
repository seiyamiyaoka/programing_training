require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'admin作成' do
    it 'adminが作成できること' do
      admin = Admin.new(
        email: 'aaa@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(admin.save).to be_truthy
    end
  end
end