class HomeController < ApplicationController
  # before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
	# before_action :check_role
  def page
    
  end

  private

  # def check_role
	# 	if	current_user.has_role? :merchant
	# 			return
	# 	else
	# 			flash[:alert] = "Welcome "#{customername}""
	# 			
	# 	end
	# end
end