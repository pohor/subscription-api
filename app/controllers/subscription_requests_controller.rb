class SubscriptionRequestsController < ApplicationController


  def new
    subscription_request = SubscriptionRequest.new
  end

  def create
    @subscription_request = SubscriptionRequest.new(subscription_request_params)
    if @subscription_request.valid?
      puts "valid"
      @customer = Customer.create(name: @subscription_request.name)
    else
      render :json => { :errors => @subscription_request.errors }
    end
  end

  private

  def subscription_request_params
    params.require(:subscription_request).permit(:name, :address, :zipcode, :card_num, :expiration, :cvv, :billing_zip, :plan_id)
  end

end
