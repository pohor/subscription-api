class AddEncryptedIvToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :encrypted_token_iv, :string
  end
end
