class HomeController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
	

  def page
		if current_user && user_signed_in? 
			render :profile
		else
			render :page
		end
  end
	
	def show
		# @product = Product.find(params[:product_id])
		@user_products = current_user.products		
	end

	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :user_id, avatar:[], products_attributes: [:id,:name,:description])
	end
  private



  def is_merchant
		if current_user && current_user.has_role?(:merchant)
		else
			flash[:alert] = "You are no authorised to access this information"
		end

	  def image_type
			if images.attached? == false
				errors.add(:avatar, "are missing!")
			end
			avatar.each do |image|
				if !image.content_type.in?(%('image/jpeg image/png))
					errors.add(:avatar, "needs to be a JPEG or PNG")
				end
			end
		end
	end



end