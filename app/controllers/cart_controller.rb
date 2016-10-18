class CartController < ApplicationController

	before_filter :authenticate_user!, except: [:add_to_cart, :view_order]

  def add_to_cart

  	@product = Product.find(params[:product_id])


  	if @product.quantity >= params[:quantity].to_i

	  	line_item = LineItem.create(product_id: params[:product_id], quantity: params[:quantity])

	  	line_item.line_item_total = line_item.quantity * line_item.product.price
	  	line_item.save

	  	redirect_to root_path

	  else
	  	redirect_to :back, notice: "Only #{@product.quantity} left. Please order accordingly."
	  end

  end



  def view_order
  	@line_items = LineItem.all
  end

  def checkout
  	line_items = LineItem.all

  	if line_items.length != 0
	  	@order = Order.create(user_id: current_user.id, subtotal: 0)

	  	line_items.each do |line_item|
	  		@order.order_items[line_item.product_id] = line_item.quantity
	  		@order.subtotal += line_item.line_item_total
	  	end

	  	@order.sales_tax = @order.subtotal * 0.07
	  	@order.grand_total = @order.subtotal + @order.sales_tax
	  	@order.save

	  	line_items.each do |line_item|
	  		line_item.product.quantity -= line_item.quantity
	  		line_item.product.save
	  	end

	  	LineItem.destroy_all

	  end
  end










end
