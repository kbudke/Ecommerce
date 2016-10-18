class StorefrontController < ApplicationController
  def all_items
  	@products = Product.all
  end

  def items_by_category
  	@category = Category.find(params[:cat_id]).name
  	@products = Product.where(category_id: params[:cat_id])
  end

  def items_by_brand
  	@brand = params[:brand]
  	@products = Product.where(brand: params[:brand])
  end
end
