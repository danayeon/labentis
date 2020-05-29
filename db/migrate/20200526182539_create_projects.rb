class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string      :title,       null: false
      t.text        :statement,   null: false
      t.references  :track_user
      t.references  :lyric_user
      t.references  :singer_user
      t.references  :video_user
      t.references  :manage_usre
      t.text        :link
      t.text        :overview
      t.datetime    :upload_at
      t.integer     :reported
      t.integer     :alert
      t.timestamps
    end

    add_foreign_key :projects, :users, column: :track_user_id
    add_foreign_key :projects, :users, column: :lyric_user_id
    add_foreign_key :projects, :users, column: :singer_user_id
    add_foreign_key :projects, :users, column: :video_user_id
    add_foreign_key :projects, :users, column: :manage_usre_id
  end
end
