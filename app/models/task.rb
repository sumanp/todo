class Task < ApplicationRecord
  belongs_to :user
  acts_as_list

  validates_presence_of :title

  scope :not_done, -> { where(completed: false) }
  scope :order_by_position, -> { order(position: :asc) }
end
