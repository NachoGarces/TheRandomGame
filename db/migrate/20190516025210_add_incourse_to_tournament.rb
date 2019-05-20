class AddIncourseToTournament < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :incourse, :boolean, default: true
  end
end
