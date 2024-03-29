class RemoveDateFromTableName < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :date, :date
  end
end
