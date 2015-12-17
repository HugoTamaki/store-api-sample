require 'rails_helper'

describe Product do
  let(:product) { FactoryGirl.create(:product) }

  describe 'Attributes' do
    it { expect(product).to have_attribute(:name) }
    it { expect(product).to have_attribute(:price) }
    it { expect(product).to have_attribute(:released_at) }
    it { expect(product).to have_attribute(:category_id) }
  end

  describe 'Relationships' do
    it { expect(product).to respond_to(:category) }
  end
end