class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, foreign_key: :attended_event_id, class_name: 'User', through: :event_attendances
  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  # def past
  #   Event.where('date < ?', Date.today)
  # end

  # def upcoming
  #   Event.where('date >= ?', Date.today)
  # end
end
