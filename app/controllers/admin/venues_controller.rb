class Admin::VenuesController < Admin::BaseController
  before_action :set_venue, only: [:edit, :update]
  before_action :verify_owner, only: [:edit]

  def edit
  end

  def update
    if @venue.update_attributes(venue_params)
      flash[:success] = "#{@venue.name} Updated Successfully!"
      redirect_to admin_dashboard_index_path
    else
      flash.now[:danger] = @venue.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name,
      :city,
      :state,
      :capacity
    )
  end

  def set_venue
    @venue = Venue.find_by_slug(params[:name])
  end

  def verify_owner
    unless current_user == @venue.admin
      render file: '/public/404', status => 404, layout: true
    end
  end
end
