module EventsHelper
  def event_venues
    Venue.all.map { |venue| [venue.name, venue.id] }
  end

  def event_categories
    Category.all.map { |category| [category.title, category.id] }
  end
end
