class AddIconetToStatuses < ActiveRecord::Migration[6.1]
  def change
    add_column :statuses, :iconet, :jsonb
  end
end
