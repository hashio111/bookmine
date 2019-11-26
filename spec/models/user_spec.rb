require 'rails_helper'

describe User do

  describe 'バリデーション' do
    it "name、email、password、password_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが空の場合登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください") 
    end

    it "emailが空の場合登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "nameが20文字以上であれば登録できないこと" do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end

    it "nameが20文字以下であれば登録できること" do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

  end

end