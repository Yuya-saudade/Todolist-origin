class AddMemoToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :memo, :string
  end
end
