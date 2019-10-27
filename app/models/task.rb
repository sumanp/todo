class Task < ApplicationRecord
  belongs_to :user
  acts_as_list

  validates_presence_of :title

  scope :not_done, -> { where(completed: false) }
  scope :order_by_position, -> { order(position: :asc) }

  def self.due_today
    self.select { |t| t.due_at.present? && t.due_at.today? }
  end
end
