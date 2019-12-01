require 'rails_helper'

describe Post do
  let(:post) { create(:post) }
  let(:other_post) { create(:post) }

  it "口コミ投稿ができること" do
    expect(post).to be_valid
  end

  describe "口コミタイトル" do
    it "口コミタイトルがないと登録できないこと" do
      post.title = nil
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "口コミタイトルが51文字以上の場合投稿できないこと" do
      post.title = "a" * 51
      post.valid?
      expect(post.errors[:title]).to include("は50文字以内で入力してください")
    end

    it "口コミタイトルが50文字以下の場合投稿できること" do
      post.title = "a" * 50
      expect(post).to be_valid
    end
  end

  describe "口コミ評価" do
    it "評価が空の場合投稿できないこと" do
      post.rate = nil
      post.valid?
      expect(post.errors[:rate]).to include("を入力してください")
    end
  end

  describe "口コミ内容" do
    it "口コミ内容が空の場合でも投稿できること" do
      post.content = nil
      expect(post).to be_valid
    end

    it "口コミ内容が301文字以上の場合投稿できないこと" do
      post.content = "a" * 301
      post.valid?
      expect(post.errors[:content]).to include("は300文字以内で入力してください")
    end

    it "口コミ内容が300文字以下の場合投稿できること" do
      post.content = "a" * 300
      expect(post).to be_valid
    end
  end

  describe "ユーザー" do
    it "ユーザーが1つの本に対して投稿できるレビューは1つだけであること" do
      other_post.product_id = post.product_id
      other_post.user_id = post.user_id
      other_post.valid?
      expect(other_post.errors[:user_id]).to include("はすでに存在します")
    end
  end
end
