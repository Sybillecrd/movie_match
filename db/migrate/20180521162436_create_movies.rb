class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id
      t.string :title
      t.string :poster
      t.string :release_date

      t.timestamps
    end
  end
end
