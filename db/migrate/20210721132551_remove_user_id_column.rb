class RemoveUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :user_id
    
  end
end
