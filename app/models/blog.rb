class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}    #Provides enumeration for status of Blog posts
  extend FriendlyId
  friendly_id :title, use: :slugged    #Applies friendly_id gem to the title of blogs for better routing

  validates_presence_of :title, :body, :topic_id #Ensures title, body, and topic_id attributes are created with each instance of a Blog

  belongs_to :topic, optional: true    #Database relationship Blogs are owned by Topic

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.recent
    order("created_at DESC")
  end
  def featured_blogs
    limit(2)
  end

end
