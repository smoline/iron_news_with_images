class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :story
  belongs_to :created_by, class_name: "User"
end
