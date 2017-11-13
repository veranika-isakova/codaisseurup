class Event < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, :ends_at, :presence => true
  validate :end_after_start
  after_initialize :default_values

  has_and_belongs_to_many :categories

  def end_after_start
    if ends_at != nil && starts_at != nil && ends_at <= starts_at
      errors.add(:ends_at, "must be after the start date")
    end
  end

  def default_values
    self.price ||= 0
    self.includes_food ||= false
    self.includes_drinks ||= false
    self.active ||= true
  end
  def bargain?
    price < 30
  end
  def self.order_by_price
    order :price
  end

  def self.alphabetical
    order(name: :asc)
  end

  scope :published, -> { where(active: true) }

   has_many :photos, dependent: :destroy
   has_one :document, :dependent => :destroy
   has_many :registrations, dependent: :destroy
   has_many :guests, through: :registrations, source: :user
end
