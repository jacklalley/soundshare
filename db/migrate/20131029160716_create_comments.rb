class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :track_id
      t.boolean :is_flagged

      t.timestamps
    end
  end
end
