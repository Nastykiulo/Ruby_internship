class AddTestResultItemsToTesrResult < ActiveRecord::Migration[5.2]
  def change
    add_reference :test_results, :test_result_item, :integer,  array: true, default: [], foreign_key: true
  end
end
