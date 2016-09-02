class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps, force: :cascade do |t|
      t.string :name,      null: false, unique: true
      t.string :start_cmd, null: false
      t.string :stop_cmd,  null: false
      t.string :repo,      null: false

      t.timestamps
    end
  end
end
