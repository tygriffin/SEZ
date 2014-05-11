class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  has_many :articles
  has_many :quizzes
end
