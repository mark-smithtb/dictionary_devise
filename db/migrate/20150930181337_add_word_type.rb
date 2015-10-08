class AddWordType < ActiveRecord::Migration
  def change
    add_column :definitions, :word_type, :string
  end
end
