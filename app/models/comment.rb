class Comment < ApplicationRecord
  belongs_to :tour
  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 5 }
end
