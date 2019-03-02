require 'rails_helper'

RSpec.describe SubscriptionRequest, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:card_num) }
  it { should validate_presence_of(:expiration) }
  it { should validate_presence_of(:cvv) }
  it { should validate_presence_of(:billing_zip) }
  
end
