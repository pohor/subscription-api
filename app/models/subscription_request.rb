require 'net/http'
require 'uri'
require 'json'

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
    uri = URI.parse("https://www.fakepay.io/purchase")
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"
      request["Authorization"] = "Token token=#{ENV['SECRET_API_TOKEN']}"
      request.body = JSON.dump({
        "amount" => "#{Plan.find_by(id: plan_id).price}",
        "card_number" => "#{card_num }",
        "cvv" => "#{cvv}",
        "expiration_month" => "#{expiration.to_date.strftime "%Y"}",
        "expiration_year" => "#{expiration.to_date.strftime "%m"}",
        "zip_code" => "#{billing_zip}"
      })

      req_options = {
        use_ssl: uri.scheme == "https",
      }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    data = JSON.parse(response.body)
  end

end
