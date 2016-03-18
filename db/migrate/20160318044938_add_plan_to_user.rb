class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users, :plane_id, :integer
  end
end
