class SubscriptionRequest
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :address, :zipcode, :card_num, :expiration, :cvv, :billing_zip, :plan_id

  validates :name, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :card_num, presence: true
  validates :expiration, presence: true
  validates :cvv, presence: true
  validates :billing_zip, presence: true
  validates :plan_id, presence: true



end
