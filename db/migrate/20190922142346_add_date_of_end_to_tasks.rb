class AddDateOfEndToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :date_finish, :date
  end
end
