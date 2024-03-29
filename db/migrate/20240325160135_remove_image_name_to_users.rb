class RemoveImageNameToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :image_name, :string
  end
end
