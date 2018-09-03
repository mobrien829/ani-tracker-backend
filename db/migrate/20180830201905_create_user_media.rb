class CreateUserMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :user_media do |t|
      t.references :user
      t.references :medium

      t.timestamps
    end
  end
end
