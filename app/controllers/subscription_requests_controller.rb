class SubscriptionRequestsController < ApplicationController
  wrap_parameters SubscriptionRequest

  def new
    @subscription_request = SubscriptionRequest.new
  end

  def create
    @subscription_request = SubscriptionRequest.new(params[:subscription_request])
    if @subscription_request.valid?
      @subscription_request.save
    else
      render @subscription_request.errors.messages
    end
  end

end
