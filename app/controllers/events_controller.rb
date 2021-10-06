class EventsController < ApplicationController
    

    def create 
        event = Event.new(event_params)
      if event.save
        render json: {event: "Success"}, status: :created
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
