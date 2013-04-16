class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :provider
      t.string   :uid
      t.string   :name
      t.string   :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end

    add_index :users, [:provider, :uid], :unique => true
    add_index :users, :oauth_token, :unique => true
  end
end
