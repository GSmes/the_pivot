class CartController < ApplicationController
  def index
    @events = @cart.all_events
  end
end
