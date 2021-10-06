class EventsController < ApplicationController
    
  def create 
    event = Event.new(event_params)
    if event.save
      render json: event, status: 201
    else
      render json: {errors: event.errors.full_messages}, status: 422
    end
  end

  private 

  def event_params
    #added_params stringifies any parameters that are not name or event_type, gsub is used to prevent parsing errors when returning the data as json 
    added_params = params[:event].permit!.to_h.select {|key| key != "name" && key != "event_type"}.to_s.gsub("=>", ":")
    params.require(:event).permit(:name, :event_type).merge({additional_data: added_params })
  end

end
