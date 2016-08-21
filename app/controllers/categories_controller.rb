class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:title])
    if @category.nil?
      render file: '/public/404', status => 404, :layout => true
    else
      @events = @category.events.where(status: 0)
    end
  end
end
