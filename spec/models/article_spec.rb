require "rails_helper"

RSpec.describe Article, type: :model do
  describe "Associations" do
    context "articleが投稿されたとき" do
      let(:user) { create(:user) }
      let(:article) { create(:article, user_id: user.id) }
      it "関連するuserのレコードが取得できること" do
        expect(article.user_id).to eq(user.id)
      end
    end
  end
end
