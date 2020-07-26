class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attr| attr['name'].blank? }
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  #Methods that works as a specific database query for category management
  def self.ruby
    where(subtitle: 'Ruby') #Though an acceptable means, it becomes extremely fragile if the string is misspelled.
  end

  #Same as above, but using the scope syntax
  scope :rails_portfolio_item, -> {where(subtitle: 'Ruby on Rails')}

  #Process that runs after something happens such as going to a form
  after_initialize :set_defaults

  #Creates default options for the main and thumb image attributes. 
  #|| operator needed. Without operater all created data would be overriden by
  #default value
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

  def self.by_position
    order("position ASC")
  end
  #The above syntax is a shorthanded way to write a conditional statement
  #if self.main_image = nil
    #self.main_image = 'https://via.placeholder.com/600x400'
  #end
end
