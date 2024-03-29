class AddDateToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :add_column, :date
  end
end
