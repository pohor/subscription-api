class Subscription < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  belongs_to :plan, dependent: :destroy
end
