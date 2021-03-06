class Teacher::AvailabilitiesController < TeacherController
  load_and_authorize_resource

  def index
    # TODO: show appointments on calendar
    @availabilities =
      if params[:start] && params[:end]
        current_teacher
          .availabilities_between(DateTime.parse(params[:start]), DateTime.parse(params[:end]))
          .map(&:to_datetime_json)
      else
        []
      end
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
      params.permit(:start, :end)
        .merge(teacher_id: current_teacher.id)
        .merge(start: params[:start].to_i-Time.zone.at(params[:start].to_i).utc_offset)
        .merge(end: params[:end].to_i-Time.zone.at(params[:end].to_i).utc_offset)
    end
end
