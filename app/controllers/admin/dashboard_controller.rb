class Admin::DashboardController < Admin::BaseController
  def index
    @venue = Venue.find_by(admin: current_user)
  end
end
