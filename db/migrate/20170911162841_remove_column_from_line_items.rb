class RemoveColumnFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :user_id
  end
end
