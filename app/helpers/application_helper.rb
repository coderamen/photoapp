module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    size = options[:size]
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

  # def admin_link
  #   link_to "All Users", users_path if @user.admin?
  # end
end
