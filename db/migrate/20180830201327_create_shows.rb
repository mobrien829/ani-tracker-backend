class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.integer :malId
      t.string :description
      t.string :coverImgString
      t.string :bannerImgString
      t.string :genres

      t.timestamps
    end
  end
end
