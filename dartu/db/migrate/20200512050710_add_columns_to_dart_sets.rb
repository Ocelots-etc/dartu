class AddColumnsToDartSets < ActiveRecord::Migration
  def change
    add_column :dart_sets, :flight, :string
    add_column :dart_sets, :body, :string
    add_column :dart_sets, :shaft, :string
  end
end
