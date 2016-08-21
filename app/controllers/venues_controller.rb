class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find_by(slug: params[:name])
    if @venue.nil?
      render file: '/public/404', status => 404, :layout => true
    end
  end
end
