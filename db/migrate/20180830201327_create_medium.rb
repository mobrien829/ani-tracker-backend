class CreateMedium < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :name,
      t.integer, :anilistId,
      t.integer, :malId,
      t.string, :description,
      t.string, :imgString

      t.timestamps
    end
  end
end
