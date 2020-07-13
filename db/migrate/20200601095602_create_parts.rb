class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :file, null: false
      t.string :name
      t.timestamps
    end
  end
end
