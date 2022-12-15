class Booking < ApplicationRecord
  belongs_to :listing
  after_create :create_mission

  def create_mission
    Mission.create(listing:, mission_type: 'first_checkin', date: start_date, price: 10)
    Mission.create(listing:, mission_type: 'last_checkin', date: end_date, price: 5)
  end
end
