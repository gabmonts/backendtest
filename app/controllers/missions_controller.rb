class MissionsController < ApplicationController
  def index
    @missions = Mission.all
    result = { missions: [] }
    if @missions
      @missions.each do |mission|
        result[:missions] << {
          listing_id: mission.id,
          mission_type: mission.mission_type,
          date: mission.date,
          price: mission.price
        }
      end
      render json: result
    end
  end

  def create
    @mission = Mission.create(params[:query])
  end
end
