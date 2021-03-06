class HomeController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
	before_action :is_merchant
  def page
    
  end

  private

  def is_merchant
		if current_user && current_user.has_role?(:merchant)
			
		else
			flash[:alert] = "You are no authorised"
			# redirect_to root_path
		end
	end
end