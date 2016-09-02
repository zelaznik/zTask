class CreateDependencies < ActiveRecord::Migration[5.0]
  def change
    create_table :dependencies, force: :cascade do |t|
      t.integer :parent_app_id, null: false
      t.integer :child_app_id, null: false

      t.timestamps
    end

    add_index :dependencies, [:parent_app_id, :child_app_id], unique: true
    add_foreign_key :dependencies, :apps, column: :parent_app_id
    add_foreign_key :dependencies, :apps, column: :child_app_id
  end
end
