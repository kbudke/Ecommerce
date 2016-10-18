class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :brands, :categories

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

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	  def configure_permitted_parameters

	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :street_address, :city, :state, :zip, :role])

	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :street_address, :city, :state, :zip, :role])
	  end
end






