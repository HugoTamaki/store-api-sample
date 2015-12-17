require 'rails_helper'

describe Api::V1::ProductsController, type: :controller do
  !let(:api_key) { FactoryGirl.create(:api_key) }

  describe 'GET index' do
    !let(:product1) { FactoryGirl.create(:product) }
    !let(:product2) { FactoryGirl.create(:product) }
    !let(:product3) { FactoryGirl.create(:product) }

    it "gets products" do
      request.env["HTTP_AUTHORIZATION"] = "Token token=#{api_key.secret_token}"
      get :index, format: :json
      expect(assigns(:products)).to eq([product1, product2, product3])
      expect(response.status).to eql(200)
    end
  end

  describe 'GET show' do
    !let(:product1) { FactoryGirl.create(:product) }

    it "gets product" do
      request.env["HTTP_AUTHORIZATION"] = "Token token=#{api_key.secret_token}"
      get :show, id: product1.id, format: :json
      expect(assigns(:product)).to eq(product1)
      expect(response.status).to eql(200)
    end
  end

  describe 'POST create' do
    it "creates product" do
      request.env["HTTP_AUTHORIZATION"] = "Token token=#{api_key.secret_token}"
      expect(Product.count).to eql(0)
      post :create, {product: {name: 'Bicicleta', price: '20.99', released_at: Time.now, category_id: 1}}, format: :json
      expect(response.status).to eql(302)
      expect(Product.count).to eql(1)
    end
  end

  describe 'PUT update' do
    !let(:product1) { FactoryGirl.create(:product) }

    it 'updates product' do
      request.env["HTTP_AUTHORIZATION"] = "Token token=#{api_key.secret_token}"
      expect(product1.name).to eql('Bicicleta')
      put :update, id: product1.id, product: {name: 'Bola'}, format: :json
      expect(product1.reload.name).to eql('Bola')
    end
  end

  describe 'DELETE destroy' do
    !let(:product1) { FactoryGirl.create(:product) }

    before { product1 }

    it 'deletes product' do
      request.env["HTTP_AUTHORIZATION"] = "Token token=#{api_key.secret_token}"
      expect(Product.count).to eql(1)
      delete :destroy, id: product1, format: :json
      expect(Product.count).to eql(0)
    end
  end
end