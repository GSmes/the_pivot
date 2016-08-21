class EventsController < ApplicationController
  def index
    @events = Event.where(status: 0)
  end

  def unavailable
    @events = Event.where(status: 1)
  end

  def show
    @event = Event.find_by(slug: params[:title])
    venue = Venue.find_by(slug: params[:name])
    if @event.nil? || venue.nil?
      render file: '/public/404', status => 404, :layout => true
    end
  end
end
