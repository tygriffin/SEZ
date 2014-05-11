class StudyNote < ActiveRecord::Base
  #attr_accessible :article_id, :body, :instance, :title

  belongs_to :article
end
