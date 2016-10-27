class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :text
      t.string :title
      t.datetime :posted_at

      t.timestamps
    end
  end
end
