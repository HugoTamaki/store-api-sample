module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]
      before_filter :restrict_access

      def index
        @products = Product.all
      end

      def show

      end

      def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to api_v1_product_path(@product)
        else
          render json: @product.errors.messages
        end
      end

      def update
        if @product.update(product_params)
          redirect_to api_v1_product_path(@product)
        else
          render json: @product.errors.messages
        end
      end

      def destroy
        @product.destroy
        render json: @product
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :price, :category_id, :released_at)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          secret, key = token.split(':')
          ApiKey.exists?(secret: secret, key: key)
        end
      end
    end
  end
end