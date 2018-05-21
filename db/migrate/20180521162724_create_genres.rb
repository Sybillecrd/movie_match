class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :picture
      t.integer :tmdb_id

      t.timestamps
    end
  end
end
