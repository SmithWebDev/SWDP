module ApplicationHelper
  def login_helper
     if current_user.is_a?(User)
       link_to "Signout", destroy_user_session_path, method: :delete
     else
       (link_to "Sign In", new_user_session_path) +
         '<br>'.html_safe +
       (link_to "Register", new_user_registration_path)
     end
  end
end
