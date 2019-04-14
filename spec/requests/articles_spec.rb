require "rails_helper"

RSpec.describe "Articles", type: :request do
  describe "GET /users" do
    subject { get(articles_path) }

    context "公開中の記事があるとき" do
      10.times do
        before do
          create(:article, post_status: :published)
        end
      end

      it "記事一覧が取得できること" do
        subject
        res = JSON.parse(response.body)
        expect(res.length).to eq(10)
        expect(res[0].keys).to include("title", "body", "user_id", "post_status")
        expect(response.status).to eq(200)
      end
    end

    context "記事がすべて非公開のとき" do
      before { create_list(:article, 10) }

      it "空配列が返ること" do
        subject
        res = JSON.parse(response.body)
        expect(res.length).to eq(0)
        expect(response.status).to eq(200)
      end
    end
  end

  describe "POST /articles" do
    subject { post(articles_path, params: params) }

    context "ユーザーがログインしているとき" do
      let(:current_user) { create(:user) }
      let(:params) { { article: attributes_for(:article, user_id: current_user.id) } }
      it "記事のレコードが作成できること" do
        expect { subject }.to change { Article.count }.by(1)
        expect(response).to have_http_status(:ok)
      end
    end

    context "ユーザーがログインしていないとき" do
      let(:current_user) { nil }
      let(:params) { { article: attributes_for(:article) } }
      it "エラーが返ってくること" do
        subject
        res = JSON.parse(response.body)
        expect(res["errors"]["status"]).to eq(403)
        expect(res["errors"]["messages"]).to eq("ログインしてください")
      end
    end
  end

  describe "GET /articles/:id" do
    subject { get article_path(article_id) }

    context "指定した記事idが見つからないとき" do
      let!(:article_id) { 1000 }
      it "エラーが返ってくること" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "指定した記事idが見つかったとき" do
      let!(:article) { create(:article, user_id: user_id, post_status: :published) }
      let(:article_id) { article.id }
      let!(:user) { create(:user) }
      let(:user_id) { user.id }
      it "記事の値が取得できること" do
        subject
        res = JSON.parse(response.body)
        expect(res["title"]).to eq(article.title)
        expect(res["body"]).to eq(article.body)
        expect(res["user_id"]).to eq(user.id)
      end
    end

    context "ユーザーがログインしているとき" do
      let!(:article) { create(:article, user_id: current_user_id) }
      let(:article_id) { article.id }
      let!(:current_user) { create(:user) }
      let(:current_user_id) { current_user.id }
      it "自分の下書き記事のレコードが取得できること" do
        subject
        res = JSON.parse(response.body)
        expect(res["title"]).to eq(article.title)
        expect(res["body"]).to eq(article.body)
        expect(res["user_id"]).to eq(current_user_id)
      end
    end
  end

  describe "PATCH /articles/:id" do
    subject { patch article_path(article.id, params) }

    let!(:article) { create(:article) }

    context "ユーザーがログインしているとき" do
      let!(:current_user) { create(:user) }
      let(:params) { { article: { title: Faker::Markdown.headers, created_at: Time.current } } }
      it "任意の記事のレコードが更新できること" do
        expect { subject }.to change { Article.find(article.id).title }.from(article.title).to(params[:article][:title])
        expect { subject }.not_to change { Article.find(article.id).body }
        expect { subject }.not_to change { Article.find(article.id).created_at }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE /articles/:id" do
    subject { delete article_path(article.id) }

    let!(:article) { create(:article) }

    context "ユーザーがログインしているとき" do
      let!(:current_user) { create(:user) }
      it "任意の記事のレコードが削除できること" do
        expect { subject }.to change { Article.count }.by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
