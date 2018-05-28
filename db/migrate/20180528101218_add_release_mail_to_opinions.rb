class AddReleaseMailToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :release_mail, :boolean, default: false
  end
end
