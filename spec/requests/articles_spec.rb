require "rails_helper"

RSpec.describe "Articles", type: :request do
  describe "GET /users" do
    subject { get(articles_path) }

    before do
      create_list(:article, 3)
    end
    it "記事一覧が取得できること" do
      subject
      res = JSON.parse(response.body)
      expect(res.length).to eq 3
      expect(res[0].keys).to include("title", "body", "user_id")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /articles" do
    subject { post(articles_path, params: params) }
    let!(:user) { create(:user)}
    let!(:params) {{ article: attributes_for(:article, user_id: user.id) }}
    it "記事のレコードが作成できること" do
      expect { subject }.to change { Article.count }.by(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /articles/:id" do
    subject { get article_path(article_id) }
    context "指定した記事idが見つからないとき" do
      let!(:article_id) { 1000 }
      it "エラーが返ってくること" do
        expect{ subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "指定した記事idが見つかったとき" do
      let(:article) { create(:article, user_id: user.id) }
      let(:article_id) { article.id }
      let!(:user) { create(:user) }
      let!(:user_id) { user.id }
      it "記事の値が取得できること" do
        subject
        res = JSON.parse(response.body)
        expect(res["title"]).to eq(article.title)
        expect(res["body"]).to eq(article.body)
        expect(res["user_id"]).to eq(user.id)
      end
    end
  end

  describe "PATCH /articles/:id" do
    subject { patch article_path(article.id, params) }
    let(:params) {{ article: { title: Faker::Markdown.headers, created_at: Time.current }}}
    let(:article) { create(:article) }
    it "任意の記事のレコードが更新できること" do
      expect { subject }.to change { Article.find(article.id).title}.from(article.title).to(params[:article][:title])
      expect { subject }.not_to change { Article.find(article.id).title }
      expect { subject }.not_to change { Article.find(article.id).body }
      expect { subject }.not_to change { Article.find(article.id).created_at }
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /articles/:id" do
    subject { delete article_path(article.id) }
    let!(:article) { create(:article) }
    it "任意の記事のレコードが削除できること" do
      expect { subject }.to change { Article.count }.by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
