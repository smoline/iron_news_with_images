class Story < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  has_many :comments, dependent: :destroy
  belongs_to :created_by, class_name: "User"

  def can_this_user_edit?(current_user)
    created_by == current_user
  end

  def can_this_user_destroy?(current_user)
    created_by == current_user
  end
end
