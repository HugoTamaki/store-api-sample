module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]

      def index
        @categories = Category.all
      end

      def show

      end

      def create
        @category = Category.new(category_params)
        if @category.save
          redirect_to api_v1_category_path(@category)
        else
          render json: @category.errors.messages
        end
      end

      def update
        if @category.update(params[:category])
          redirect_to api_v1_product_path(@category)
        else
          render json: @category.errors.messages
        end
      end

      def destroy
        @category.destroy
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:product).permit(:name)
      end
    end
  end
end