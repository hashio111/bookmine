require 'rails_helper'

describe Product do
  let(:product) { build(:product) }
  it "本の登録ができること" do
    expect(product).to be_valid
  end
  it "titleがないと登録できないこと" do
    product.title = nil
    product.valid?
    expect(product.errors[:title]).to include("を入力してください")
  end
end
