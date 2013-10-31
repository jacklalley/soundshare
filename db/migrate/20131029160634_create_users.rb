class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :role
      t.text :bio
      t.text :css
      t.boolean :is_first_login

      t.timestamps
    end
  end
end
