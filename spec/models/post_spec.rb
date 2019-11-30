require 'rails_helper'

describe Post do
  let(:post) { create(:post) }

  it "口コミ投稿ができること" do
    expect(post).to be_valid
  end

  describe "タイトル" do
    it "タイトルがないと登録できないこと" do
      post.title = nil
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "タイトルが51文字以上の場合登録できないこと" do
      post.title = "a" * 51
      post.valid?
      expect(post.errors[:title]).to include("は50文字以内で入力してください")
    end
  end

  describe "評価" do
    it "評価が空の場合投稿できないこと" do
      post.rate = nil
      post.valid?
      expect(post.errors[:rate]).to include("を入力してください")
    end
  end
end
