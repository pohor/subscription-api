require 'rest-client'

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

  def send_request
    data = { 'amount' => "#{Plan.find_by(id: plan_id).price}", 'card_number' => "#{card_num }" }

    headers = { :content_type => :json, 'authorisation' => "Token token=#{ENV['SECRET_API_TOKEN']}" }

    url = 'https://www.fakepay.io/purchase'

    response = RestClient.post url, data.to_json, headers

  end

end
