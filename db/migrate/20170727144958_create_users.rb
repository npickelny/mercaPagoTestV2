class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :mp_user_id, null: false
      t.string :public_key, null: false
      t.string :access_token, null: false
      t.string :refresh_token, null: false
      t.integer :expires_in, null: false
      t.date :date_keys_obtained, null: false
      t.timestamps
    end
  end
end