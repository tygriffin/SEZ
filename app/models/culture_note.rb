class CultureNote < ActiveRecord::Base
  attr_accessible :publication_id, :body, :instance, :title
  belongs_to :publication
end
