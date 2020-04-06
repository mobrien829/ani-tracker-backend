class CreateShows < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :shows do |t|
      t.hstore 'title', default: {}
      t.integer :malId
      t.string :description
      t.hstore 'coverImgString', default: {}
      t.string :bannerImgString
      t.string 'genres', array: true

      t.timestamps
    end
    add_index :shows, :genres, using: 'gin'
  end
end
