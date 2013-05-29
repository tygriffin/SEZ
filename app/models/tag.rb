class Tag < ActiveRecord::Base
  belongs_to :publication
  attr_accessible :name
end
