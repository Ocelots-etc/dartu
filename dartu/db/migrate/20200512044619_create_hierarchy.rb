class CreateHierarchy < ActiveRecord::Migration
  def change
    create_table :dart_cases do |t|
      t.string :name
      t.integer :user_id
    end
    create_table :dart_sets do |t|
      t.string :name
      t.string :condition
      t.string :manufacturer
      t.integer :dart_case_id
    end
  end
end
