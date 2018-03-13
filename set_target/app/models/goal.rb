class Goal < ApplicationRecord
  validates :user, :title, presence: true

  belongs_to :user
end
