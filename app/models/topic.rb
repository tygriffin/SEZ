class Topic < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :articles
end
