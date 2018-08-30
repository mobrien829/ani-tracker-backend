class CreateUserMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :user_media do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :medium, foreign_key: true

      t.timestamps
    end
  end
end
