require 'rails_helper'

describe User do
  it "titleがないと登録できないこと" do
    product = build(:product, title: "")
    product.valid?
    expect(product.errors[:title]).to include("を入力してください")
  end
end
