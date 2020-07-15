class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
end
