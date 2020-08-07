class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attr| attr['name'].blank? }
  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  #Methods that works as a specific database query for category management
  def self.ruby
    where(subtitle: 'Ruby') #Though an acceptable means, it becomes extremely fragile if the string is misspelled.
  end

  #Same as above, but using the scope syntax
  scope :rails_portfolio_item, -> {where(subtitle: 'Ruby on Rails')}

  def self.by_position
    order("position ASC")
  end
end
