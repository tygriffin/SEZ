class Tag < ActiveRecord::Base
  belongs_to :article
  attr_accessible :name
end
