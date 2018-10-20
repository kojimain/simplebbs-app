class BbsThread < ApplicationRecord
  has_many :bbs_posts
  
  validates :title,
    presence: true
end
