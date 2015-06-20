class AddSoundCloudAccessTokenToUser < ActiveRecord::Migration
  def up
    remove_column :users, :email, :text
    remove_column :users, :password_digest, :text

    add_column :users, :access_token, :text
  end

  def down
    remove_column :users, :access_token, :text

    add_column :users, :password_digest, :text
    add_column :users, :email, :text
  end
end
