require 'rails_helper'

describe ApiKey do
  !let(:api_key) { FactoryGirl.create(:api_key) }

  describe "Attributes" do
    it { expect(api_key).to have_attribute(:secret) }
    it { expect(api_key).to have_attribute(:key) }
  end
end
