require 'rails_helper'

describe Category do
  let(:category) { FactoryGirl.create(:category) }

  describe 'Attributes' do
    it { expect(category).to have_attribute(:name) }
  end

  describe 'Relationships' do
    it { expect(category).to respond_to(:products) }
  end
end