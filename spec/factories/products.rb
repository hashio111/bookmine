FactoryBot.define do
  factory :product do
    title { "testproduct" }
    image_url { "noimage.jpg" }
    author { "testauthor" }
    description { "testdescription" }
    publisher { "testpublisher" }
  end
end
