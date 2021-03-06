module ApplicationHelper
  #def after_sign_out_path_for(resource_or_scope)
  #  request.referrer
  #end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    #nav_links = <<NAV
    #<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
    #<#{tag_type}><a href="#{about_path}" class="#{style} #{active? about_path}">About</a></#{tag_type}>
    #<#{tag_type}><a href="#{contact_path}" class="#{style}  #{active? contact_path}">Contact</a></#{tag_type}>
    #<#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a></#{tag_type}>
    #<#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>
    #NAV
    nav_links.html_safe
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: 'SWD' , sticky: false)
  end

  def active? path
    "active" if current_page? path
  end

  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Sign In", new_user_session_path, class: style) +
        ' '.html_safe +
        (link_to "Register", new_user_registration_path, class: style)
    else
      link_to "Signout", destroy_user_session_path, class: style, method: :delete
      #redirect_to root_path
    end
  end
  #after_sign_out_path_for()

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{ link_to 'contact me', contact_path } if you'd like to work together"
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    SmithViewTool::Renderer.copyright 'SmithWebDev', 'All Rights Reserved'
  end

end
