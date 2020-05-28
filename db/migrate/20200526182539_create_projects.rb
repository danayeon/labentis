class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :product_id, null: false, foreign_key: true
      t.text :title, null: false
      t.text :url, null: false
      t.text :overview, null: false
      t.integer :reported
      t.integer :alert
      t.datetime :upload_at, null: false
      t.timestamps
    end
  end
end
