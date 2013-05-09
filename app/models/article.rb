class Article < ActiveRecord::Base
  attr_accessible :author, :body, :description, :title
  has_many :vocabulary_words
end
