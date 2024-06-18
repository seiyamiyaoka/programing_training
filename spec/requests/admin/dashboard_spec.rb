require 'rails_helper'

RSpec.describe "Admin::Dashboards", type: :request do
  describe "GET /admin_dashboards" do
    context 'ログインしていない場合' do
      it 'ログイン画面にリダイレクトされること' do
        get "/admin/dashboard"
        expect(response).to have_http_status(302)
      end
    end

    context 'ログインしている場合' do
      before do
        admin = Admin.create(
          email: 'aaa@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        sign_in admin
      end

      it 'ダッシュボードが表示されること' do
        get "/admin/dashboard"
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
        expect(assigns[:service]).to be_a(AnalyticsService)
        # 変数の中身を確認
        service = assigns[:service]
        expect(service.evaluation_metrics).to eq([{ name: 'ブログ数', value: 0 }])

      end
    end
    
  end
end