class CreateUserShows < ActiveRecord::Migration[5.2]
  def change
    create_table :user_shows do |t|
      t.references :user
      t.references :show

      t.timestamps
    end
  end
end
