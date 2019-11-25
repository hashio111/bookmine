class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image_url
      t.string :author
      t.text :description
      t.string :publisher
      t.string :release_date
      t.timestamps
    end
  end
end