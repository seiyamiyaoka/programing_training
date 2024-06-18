require 'rails_helper'

RSpec.describe "Admin::AdminLogins", type: :request do
  describe "GET /admin_admin_logins" do
    it "works! (now write some real specs)" do
      get "/admins/sign_in"
      expect(response).to have_http_status(200)
    end
  end
end