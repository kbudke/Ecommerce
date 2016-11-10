class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :brands, :categories
  helper_method :current_order


  def brands
  	@brands = Product.pluck(:brand)
     if @brands == nil
        @brands = []
    elsif @brands.length > 1
      @brands.sort.uniq!
    end
  end

  def categories
  	@categories = Category.order(:name)
  end

def current_order
  if !session[:order_id].nil?
    Order.find(session[:order_id])
  else
    Order.new
  end
end

  def states
    @states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NE KS OK TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY NJ CT RI MA VT NH ME DC PR)
    @states.sort!
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :street_address, :city, :state, :zip, :role])

      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :street_address, :city, :state, :zip, :role])
    end
end





