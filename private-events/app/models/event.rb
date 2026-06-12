class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, allow_blank: true, length: { maximum: 125 }
  validates :location, presence: true, length: { minimum: 3, maximum: 50 }
  validates :starts_at, presence: true
  validate :starts_at_cannot_be_in_the_past
  
  private
    def starts_at_cannot_be_in_the_past
      if starts_at.present? && starts_at < Time.now
        errors.add(:starts_at, "can't be in the past")
      end
    end
end
