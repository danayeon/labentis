class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :project, foreign_key: true, null: false
      t.references :user,    foreign_key: true, null: false
      t.integer    :track,                      null: false
      t.integer    :lyric,                      null: false
      t.integer    :singer,                     null: false
      t.integer    :video,                      null: false
      t.integer    :permission
      t.text       :comment
      t.timestamps
    end
  end
end
