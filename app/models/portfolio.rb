class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  #Methods that works as a specific database query for better category management
  def self.ruby
    where(subtitle: "Ruby")
  end

  scope :rails_portfolio_item, -> {where(subtitle: "Ruby on Rails")}
  #  def self.rails
  #    where(subtitle: "Ruby on Rails")
  #  end
end
