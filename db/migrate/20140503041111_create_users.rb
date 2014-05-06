class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :salt
      t.string :fish
      t.string :code
      t.datetime :expires_at

      t.timestamps
    end
  end
end
