require 'rails_helper'

RSpec.describe "コンソール特訓!!!", type: :model do

  describe 'コンソール特訓!!!' do
    it 'コンソール特訓!!!' do
      expect(1 + 1).to eq 2
    end
  end

  # adminのCRUDテスト SEE: app/models/admin.rb
  describe 'admin' do
    context '作成' do
      it 'adminが作成できること' do
        admin = Admin.new(
          email: 'aaa@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(admin.save).to be_truthy
      end

      it 'createメソッドを使ってadminが作成できること' do
        admin = Admin.create(
          email: 'aaa@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(admin.id).not_to be_nil
      end

      it 'インスタンスを作成してそれぞれの属性を設定してadminが作成できること' do
        admin = Admin.new
        admin.email = 'aaa@example.com'
        admin.password = 'password'
        admin.password_confirmation = 'password'
        expect(admin.save).to be_truthy
      end
    end

    context '更新' do
      it 'adminが更新できること' do
        admin = Admin.create(
          email: 'aaa@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        admin.email = 'bbb@example.com'
        expect(admin.save).to be_truthy
      end

      it 'ハッシュを使ってadminが更新できること' do
        admin = Admin.create(
          email: 'aaa@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        admin_params = {
          email: 'bbb@example.com',
          password: 'password',
          password_confirmation: 'password'
        }

        admin.update(admin_params)
        expect(admin.email).to eq 'bbb@example.com'
      end
    end

    context '削除' do
      it 'adminが削除できること' do
        admin = Admin.create(
          email: 'aaa@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(admin.destroy).to be_truthy
      end
    end

    context '複数データの取り扱い' do
      before do
        10.times do |i|
          Admin.create(
            email: "email#{i}@example.com",
            password: 'password',
            password_confirmation: 'password'
          )
        end

        Admin.create(
          email: 'superuser@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
      end

      it 'adminが一覧できること' do
        expect(Admin.all.count).to eq 11
      end

      it '先頭と最後のuserのidの差を取得' do
        expect(Admin.last.id - Admin.first.id).to eq 10
      end

      it 'emailがsuperuser@example.comのadminがfind_byで取得できること' do
        admin = Admin.find_by(email: 'superuser@example.com')
        expect(admin.email).to eq 'superuser@example.com'
      end

      it 'emailがsuperuser@example.comのadminがwhereで取得できること' do
        admins = Admin.where(email: 'superuser@example.com')
        expect(admins.first.email).to eq 'superuser@example.com'
      end

      it 'すべてのadminが削除できること' do
        expect(Admin.all.count).to eq 11
        Admin.destroy_all
        expect(Admin.all.count).to eq 0
      end

      it 'すべてのadminのcreated_atを更新できること' do
        setting_time = Time.current
        Admin.update_all(created_at: setting_time)
        all_adimins = Admin.all

        all_adimins.each do |admin|
          expect(admin.created_at).to eq setting_time
        end

      end

    end
  end

  # writerのCRUDテスト SEE: app/models/writer.rb
  describe 'writer' do
  end
  # blogのCRUDテスト SEE: app/models/blog.rb, りレーションがあるので、データ作成にはwriterが必要です
  describe 'blog' do
  end

  # commentのCRUDテスト SEE: app/models/comment.rb, りレーションがあるので、データ作成にはwriterとblogが必要です
  describe 'comment' do
  end
  
  # favoriteのCRUDテスト SEE: app/models/favorite.rb, りレーションがあるので、データ作成にはwriterとblogが必要です
  describe 'favorite' do
  end

  # AnalyticsServiceのテスト SEE: app/models/analytics_service.rb
  describe 'AnalyticsService' do
  end

end
