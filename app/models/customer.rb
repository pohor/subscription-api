class Customer < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
end
