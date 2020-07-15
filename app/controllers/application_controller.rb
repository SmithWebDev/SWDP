
class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern

end
