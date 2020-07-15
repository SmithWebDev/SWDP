module CurrentUserConcern
  extend ActiveSupport::Concern

  # Null Object Pattern
  def current_user
    # Super maintains the original method associated with current_user. 
    # OpenStruct allows up to create a replacement for a null object. 
    # Super has a class of User (as asssociated with the current_user method
    # through devise) and OpenStruct is its own special Class.
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: 'Guest User',
                   first_name: 'Guest',
                   last_name: 'User',
                   email: 'guest@example.com'
                )
  end
end

