class Subscription < ApplicationRecord
  attr_encrypted :token, key: Rails.application.credentials.key

  belongs_to :customer, dependent: :destroy
  belongs_to :plan, dependent: :destroy


end
