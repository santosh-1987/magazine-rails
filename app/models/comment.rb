class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_ancestry
  validates :user_id, :body,:article_id, :presence => true
end