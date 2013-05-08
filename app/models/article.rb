class Article < ActiveRecord::Base
  attr_accessible :author, :body, :description, :title
end
