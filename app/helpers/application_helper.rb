module ApplicationHelper
  def login_helper style = ''
     if current_user.is_a?(GuestUser)
       (link_to "Sign In", new_user_session_path, class: style) +
         ' '.html_safe +
       (link_to "Register", new_user_registration_path, class: style)
     else
       link_to "Signout", destroy_user_session_path, class: style, method: :delete
     end
  end
  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}. You are currently on the #{layout_name} layout."
      content_tag(:p, greeting, class: 'source-greeting')
     end
  end
  def copyright_generator
    SmithViewTool::Renderer.copyright 'SmithWebDev', 'All Rights Reserved'
  end
end
