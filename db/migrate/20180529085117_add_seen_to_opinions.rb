class AddSeenToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :seen, :boolean, default: false
  end
end
