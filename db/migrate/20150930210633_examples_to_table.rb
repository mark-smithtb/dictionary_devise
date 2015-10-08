class ExamplesToTable < ActiveRecord::Migration
  def change
    remove_column :definitions, :example, :string
    create_table :examples do |t|
      t.string :example
      t.integer :definition_id
      t.timestamps null: false
    end
  end
end
