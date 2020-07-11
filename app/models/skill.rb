class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized


  #Creates default options for the main and thumb image attributes. 
  #|| operator needed. Without operater all created data would be overriden by
  #default value
  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
  end
end
