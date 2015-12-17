require 'rails_helper'

describe Api::V1::CategoriesController, type: :controller do
  describe 'GET index' do
    !let(:category1) { FactoryGirl.create(:category) }
    !let(:category2) { FactoryGirl.create(:category) }
    !let(:category3) { FactoryGirl.create(:category) }

    it "gets categories" do
      get :index, format: :json
      expect(assigns(:categories)).to eq([category1, category2, category3])
      expect(response.status).to eql(200)
    end
  end

  describe 'GET show' do
    !let(:category1) { FactoryGirl.create(:category) }

    it "gets category" do
      get :show, id: category1.id, format: :json
      expect(assigns(:category)).to eq(category1)
      expect(response.status).to eql(200)
    end
  end

  describe 'POST create' do
    it "creates category" do
      expect(Category.count).to eql(0)
      post :create, {category: {name: 'Toys'}}, format: :json
      expect(response.status).to eql(302)
      expect(Category.count).to eql(1)
    end
  end

  describe 'PUT update' do
    !let(:category1) { FactoryGirl.create(:category) }

    it 'updates category' do
      expect(category1.name).to eql('Toys')
      put :update, id: category1.id, category: {name: 'Cards'}, format: :json
      expect(category1.reload.name).to eql('Cards')
    end
  end

  describe 'DELETE destroy' do
    !let(:category1) { FactoryGirl.create(:category) }

    before { category1 }

    it 'deletes product' do
      expect(Category.count).to eql(1)
      delete :destroy, id: category1, format: :json
      expect(Category.count).to eql(0)
    end
  end
end