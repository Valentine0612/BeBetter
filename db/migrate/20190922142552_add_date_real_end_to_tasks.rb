class AddDateRealEndToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :date_real_end, :date
  end
end
