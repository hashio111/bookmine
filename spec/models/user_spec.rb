require 'rails_helper'

describe User do
  let(:user) { build(:user) }
  let(:other_user) { build(:user) }
  describe "バリデーション" do
    it "name、email、password、password_confirmationが存在すれば登録できること" do
      expect(user).to be_valid
    end

    it "nameが空の場合登録できないこと" do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailが空の場合登録できないこと" do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空では登録できないこと" do
      user.password = nil
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user.password_confirmation = ""
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "nameが16文字以上であれば登録できないこと" do
      user.name = "a" * 16
      user.valid?
      expect(user.errors[:name]).to include("は15文字以内で入力してください")
    end

    it "nameが15文字以下であれば登録できること" do
      user.name = "a" * 15
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user, email: "test@gmail.com")
      other_user = build(:user, email: "test@gmail.com")
      other_user.valid?
      expect(other_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが6文字以上であれば登録できること" do
      user.password = "a" * 6
      user.password_confirmation = "a" * 6
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user.password = "a" * 5
      user.password_confirmation = "a" * 5
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

  describe "フォロー機能の検証" do
    context "フォローしていない状態の場合" do
      it "ユーザーをフォローできること" do
        user = create(:user)
        other_user = build(:user)
        user.follow(other_user)
        expect(user.following?(other_user)).to eq true
      end
    end
    context "フォローしている状態の場合" do
      it "ユーザーをフォロー解除できること" do
        user = create(:user)
        other_user = build(:user)
        user.follow(other_user)
        user.unfollow(other_user)
        expect(user.following?(other_user)).to eq false
      end
    end
  end
end
