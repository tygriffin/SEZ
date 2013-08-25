class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  attr_accessible :description, :name
  has_many :articles
  has_many :quizzes
end
