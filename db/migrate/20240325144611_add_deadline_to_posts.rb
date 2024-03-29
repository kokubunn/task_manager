class AddDeadlineToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :deadline, :date, null: true
  end
end
