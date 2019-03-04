class SubscriptionRequestsController < ApplicationController

  def new
    subscription_request = SubscriptionRequest.new
  end

  def create
    @subscription_request = SubscriptionRequest.new(subscription_request_params)
    if @subscription_request.valid?
      @response = @subscription_request.send_request
        if @response[:success] == true
          @customer = Customer.create(customer_params)
          @subscription = Subscription.create(subscription_params)
          render :json => { success: @response[:message] }
        else
          render :json => { error: @response[:message] }
        end
    else
      render :json => { :errors => @subscription_request.errors }
    end
  end

  private

  def subscription_request_params
    params.require(:subscription_request).permit(:name, :address, :zipcode, :card_num, :expiration, :cvv, :billing_zip, :plan_id)
  end

  def customer_params
    customer_params = { name: @subscription_request.name }
  end

  def subscription_params
     subscription_params = { customer_id: @customer.id, plan_id: @subscription_request.plan_id, token: @response[:token], price: Plan.find_by(id: @subscription_request.plan_id).price }
  end

end
