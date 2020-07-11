class Topic < ApplicationRecord
  validates_presence_of :title  #Ensures that all Topics created has a title associated

  has_many :blogs   #Database relationship showing that Topics own many blogs
end
