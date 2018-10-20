class BbsThread < ApplicationRecord
  validates :title,
    presence: true
end
