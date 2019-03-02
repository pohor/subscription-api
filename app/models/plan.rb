class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
end
