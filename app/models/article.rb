class Article < ActiveRecord::Base
  belongs_to :journal
  has_many :comments
  validates :title ,:presence => { :message => "can not be blank." },length: { in: 1..30 }
  validates :body ,:presence => { :message => "can not be blank." }
  validates :author ,:presence => { :message => "can not be blank." },length: { in: 1..30 }
end