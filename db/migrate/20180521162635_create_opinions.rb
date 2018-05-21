class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :value

      t.timestamps
    end
  end
end
