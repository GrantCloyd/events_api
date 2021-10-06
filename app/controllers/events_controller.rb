class EventsController < ApplicationController
    ActionController::Parameters.permit_all_parameters = true

  def create 
    event = Event.new(event_params)
    if event.save
      render json: {event: event}, status: 201
    else
      render json: {errors: event.errors.full_messages}, status: 422
    end
  end

  private 

  def event_params
      addl_params = params[:event].to_h.select {|key| key != "name" && key != "event_type"}.to_s
      params.require(:event).permit(:name, :event_type).merge({additional_data: addl_params })
  end

end
