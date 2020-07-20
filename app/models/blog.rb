class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}    #Provides enumeration for status of Blog posts
  extend FriendlyId
  friendly_id :title, use: :slugged    #Applies friendly_id gem to the title of blogs for better routing

  validates_presence_of :title, :body #Ensures title and body attributes are created with each instance of a Blog

  belongs_to :topic, optional: true    #Database relationship Blogs are owned by Topic
end
