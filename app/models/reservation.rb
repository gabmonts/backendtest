class Reservation < ApplicationRecord
  belongs_to :listing
  after_create :create_mission

  def create_mission
    Mission.create(listing:, mission_type: 'checkout_checkin', date: end_date, price: 10 * listing.num_rooms) unless Booking.where(listing:).any? { |booking| booking.end_date == end_date }
  end
end
