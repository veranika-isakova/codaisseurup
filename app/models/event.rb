class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validate :end_after_start?
  validates :starts_at, :ends_at, :presence => true

  private

  def end_after_start

    if ends_at < starts_at
      errors.add(:ends_at, "must be after the start date")
    end
  end
end
