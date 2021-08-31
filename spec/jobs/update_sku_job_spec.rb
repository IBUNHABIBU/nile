require 'rails_helper'

RSpec.describe UpdateSkuJob, type: :job do
  it 'calls sku service with correct params' do 
    described_class.perform_now('eloquent ruby')
  end
end
