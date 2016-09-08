class Teacher::AvailabilitiesController < ApplicationController
  before_action :authenticate_teacher!

  def index
    # TODO: retrieve availabilities for current week only
    @availabilities = current_teacher.availabilities.map(&:to_datetime_json)
    respond_to do |format|
      format.html
      format.json { render json: @availabilities}
    end
  end

  def create
    availability = Availability.create(availability_params)
    if availability
      render json: { status: 200, availability: availability.to_datetime_json }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    availability = current_teacher.availabilities.find(params[:id])
    if availability and availability.destroy
      render json: { status: 200, availability: availability }
    else
      render json: { status: 500 }
    end
  end

  private

    def availability_params
      params.permit(:start, :end).merge(teacher_id: current_teacher.id)
    end
end
