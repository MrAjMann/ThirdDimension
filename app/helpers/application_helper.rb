module ApplicationHelper
  def user_avatar(user, size=125)
    if user.avatar.attached?
      user.avatar
    else
     gravatar_image_url(user.email, size: 125)
    end
  end
end
