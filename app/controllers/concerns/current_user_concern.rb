module CurrentUserConcern
  extend ActiveSupport::Concern

  # Null Object Pattern
  def current_user
    # Super maintains the original method associated with current_user. 
    # OpenStruct allows up to create a replacement for a null object. 
    # Super has a class of User (as asssociated with the current_user method
    # through devise) and OpenStruct is its own special Class.
    super || guest_user #|| test_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = 'Guest User',
    guest.first_name = 'Guest',
    guest.last_name = 'User',
    guest.email = 'guest@example.com'
    guest
  end
  #def test_users
  #  test = TestUser.new
  #  test.name = 'Test User',
  #  test.first_name = 'Test',
  #  test.last_name = 'User',
  #  test.email = 'test@example.com'
  #  test
  #end
end

