class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :description
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
