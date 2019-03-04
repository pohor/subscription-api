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

    if data["success"] == true
      message = { success: true, token: data["token"], message: "Successfuly added a new subscription"}
    else
      if data["error_code"] == 1000001
        message = { success: false, message: "Invalid credit card number" }
      elsif data["error_code"] == 1000002
        message = { success: false, message: "Insufficient funds" }
      elsif data["error_code"] == 1000003
        message = { success: false, message: "CVV failure" }
      elsif data["error_code"] == 1000004
        message = { success: false, message: "Expired card" }
      elsif data["error_code"] == 1000005
        message = { success: false, message: "Invalid zip code" }
      elsif data["error_code"] == 1000006
        message = { success: false, message: "Invalid purchase amount" }
      elsif data["error_code"] == 1000007
        message = { success: false, message: "Invalid token" }
      elsif data["error_code"] == 1000008
        message = { success: false, message: "Invalid params: cannot specify both token and other credit card params like card_number, cvv, expiration_month, expiration_year or zip." }
      else
        message = { success: false, message: "Attempting a purchase with invalid API credentials" }
      end
      return message
    end

  end

end
