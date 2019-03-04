class ChangeSubscriptionsTokenToEncrypted < ActiveRecord::Migration[5.2]
  def change
    rename_column :subscriptions, :token, :encrypted_token
  end
end
