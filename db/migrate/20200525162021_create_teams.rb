class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.references :track_user,   null:false
      t.references :lyric_user,   null:false
      t.references :singer_user,  null:false
      t.references :video_user,   null: false
      t.timestamps
    end
    add_foreign_key :teams, :users, column: :track_user_id
    add_foreign_key :teams, :users, column: :lyric_user_id
    add_foreign_key :teams, :users, column: :singer_user_id
    add_foreign_key :teams, :users, column: :video_user_id
  end
end
