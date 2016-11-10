class AdministrationController < ApplicationController

  before_filter :authenticate_user!
  
  def user_list
  	@employees = User.where(role: "admin")
  	@customers = User.where(role: "guest")
  end

  def add_admin
  	User.find(params[:id]).update(role: "admin")
  	redirect_to :back
  end

  def remove_admin
  	User.find(params[:id]).update(role: "guest")
  	redirect_to :back
  end

  def invoices
    if params[:choice] == nil || params[:choice] == "date"
      @orders = Order.where.not(user_id: nil)
    elsif params[:choice] == "total" 
      @orders = Order.where.not(user_id: nil).order(grand_total: :desc)
    elsif params[:choice] == "size"
      @orders = Order.where.not(user_id: nil).order("LENGTH(order_items) DESC")
    end

    @my_money = 0
    @orders.each do |order|
      @my_money += order.grand_total.to_f
    end
  end


end