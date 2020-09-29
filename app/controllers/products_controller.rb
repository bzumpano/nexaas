class ProductsController < ApplicationController

  PERMITTED_PARAMS = %i[
    name
    price
  ]

  # actions

  def create
    product.save!
    object_response(product, :created)
  end

  def update
    product.update_attributes!(resource_params)
    object_response(product)
  end

  def destroy
    if product.destroy!
    object_response(product)
    end
  end

  def show
    object_response(product)
  end

  private

  def product
    @product ||= find_action? ? Product.find(params[:id]) : Product.new(resource_params)
  end

  def resource_params
    params.require(:product).permit(*PERMITTED_PARAMS) if params[:product]
  end

  def find_action?
    %w[update destroy show].include?(action_name)
  end
end
