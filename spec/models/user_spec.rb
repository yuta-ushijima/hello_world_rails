require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    context "accountを指定しているとき" do
      let(:user) { build(:user) }

      it "ユーザーが作成できること" do
        expect(user).to be_valid
      end
    end

    context "accountを指定していないとき" do
      let(:user) { build(:user, account: nil) }

      it "バリデーションエラーが返ること" do
        user.valid?
        expect(user.errors.messages[:account]).to include("can't be blank")
      end
    end

    context "accountが重複しているとき" do
      let(:user) { create(:user) }
      let(:new_user) { build(:user, account: user.account) }

      it "バリデーションエラーとなること" do
        new_user.valid?
        expect(new_user.errors.messages[:account]).to include("has already been taken")
      end
    end
  end
end
