class CreateUserMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :user_media do |t|
      t.references, :userId
      t.references :mediumId, foreign_key: true

      t.timestamps
    end
  end
end
