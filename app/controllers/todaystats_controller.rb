class TodaystatsController < ApplicationController

  def index 
    daily_events_by_count = Event.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).group(:event_type).count
    data = daily_events_by_count.collect {|k, v| {k => v} }
    render json: {todays_stats: data}
  end
      

end
