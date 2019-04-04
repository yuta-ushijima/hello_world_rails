require 'rails_helper'

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
      expect(res[0].keys).to eq %w(account name email)
      expect(response.status).to eq 200
      # 別解: expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "ユーザーのレコードが作成できること" do

    end
  end

  describe "GET /users/:id" do
    subject { get user_path(user_id) }
    context "指定したユーザーidが見つからないとき" do
      let(:user_id) { 1000 }
      it 'エラーが返ってくること' do
        expect{ subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "指定したユーザーidが見つかったとき" do
      let(:user) { create(:user) }
      let(:user_id) { user.id}
      it 'ユーザーの値が取得できること' do
        subject
        res = JSON.parse(response.body)
        expect(res["account"]).to eq user.account
        expect(res["name"]).to eq user.name
        expect(res["email"]).to eq user.email
      end
    end
  end

  describe "PATCH /users/:id" do
    it '任意のユーザーのレコードが更新できること' do

    end
  end

  describe "DELETE /users/:id" do
    it '任意のユーザーのレコードが削除できること' do

    end
  end
end
