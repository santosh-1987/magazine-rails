class Journal < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  validates :name ,:presence => { :message => "can not be blank." },length: { in: 1..30 }
end