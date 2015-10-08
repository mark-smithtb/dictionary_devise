class AddExample < ActiveRecord::Migration
  def change
    add_column :definitions, :example, :string
  end
end
