class AddTestToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :test, foreign_key: true
  end
end
