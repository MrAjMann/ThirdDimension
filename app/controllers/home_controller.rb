class HomeController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
	

  def page
		# We check if a user is signed in or not 
		if current_user && user_signed_in? 
			#If they are signed in then we show thier profile
			render :profile
		else
			render :page
			#If not then we show the landing page
		end
  end
	
	def show
		# @product = Product.find(params[:product_id])
		@user_products = current_user.products		
	end

	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :user_id, avatar:[],products_attributes: [:id,:name,:description])
	end
  private



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

