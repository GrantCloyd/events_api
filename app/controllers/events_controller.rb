class EventsController < ApplicationController

    def create 

    end

    private 

    def event_params
     params.require(:event).permit(:c)
    end

end
