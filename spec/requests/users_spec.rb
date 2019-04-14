require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject { get(users_path) }

    before do
      create_list(:user, 3)
    end

    it "ユーザー一覧が取得できること" do
      subject
      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq %w[account name email]
      expect(response.status).to eq 200
      # 別解: expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    subject { post(users_path, params: params) }

    let(:params) { { user: attributes_for(:user) } }
    it "ユーザーのレコードが作成できること" do
      expect { subject }.to change { User.count }.by(1)
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "GET /users/:id" do
    subject { get user_path(user_id) }

    context "指定したユーザーidが見つからないとき" do
      let(:user_id) { 1000 }
      it "エラーが返ってくること" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "指定したユーザーidが見つかったとき" do
      let(:user) { create(:user) }
      let(:user_id) { user.id }
      it "ユーザーの値が取得できること" do
        subject
        res = JSON.parse(response.body)
        expect(res["account"]).to eq user.account
        expect(res["name"]).to eq user.name
        expect(res["email"]).to eq user.email
      end
    end
  end

  describe "PATCH /users/:id" do
    subject { patch user_path(user.id, params) }

    let(:params) { { user: { name: Faker::Name.name, created_at: Time.current } } }
    let(:user) { create(:user) }
    it "任意のユーザーのレコードが更新できること" do
      expect { subject }.to change { User.find(user.id).name }.from(user.name).to(params[:user][:name])
      expect { subject }.not_to change { User.find(user.id).account }
      expect { subject }.not_to change { User.find(user.id).email }
      expect { subject }.not_to change { User.find(user.id).created_at }
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "DELETE /users/:id" do
    subject { delete user_path(user.id) }

    let!(:user) { create(:user) }
    it "任意のユーザーのレコードが削除できること" do
      expect { subject }.to change { User.count }.by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
