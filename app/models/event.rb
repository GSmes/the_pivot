class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  has_many :order_events
  has_many :orders, through: :order_events
  has_attached_file :upload_image, default_url: 'http://i.imgur.com/5p6sEsX.jpg'
  validates :title, presence: true, uniqueness: { scope: [:venue_id, :date] }
  validates :price, presence: true, :numericality => {:greater_than => 0}
  validates :category, presence: true
  validates :venue, presence: true
  validates_attachment_content_type :upload_image, :content_type => /\Aimage\/.*\Z/
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  before_validation :create_slug

  after_create :set_image_path

  enum status: %w(upcoming occurred)

  def venue_name
    venue.name
  end

  def past_event?
    status == 'occurred'
  end

  def update_image_path
    unless upload_image.url == 'http://i.imgur.com/5p6sEsX.jpg'
      update_image
    end
  end

  def set_image_path
    update_image unless image_path
  end

  def to_param
    slug
  end

  def event_date
    date.strftime("%m-%d-%Y")
  end

  private

  def create_slug
    self.slug = "#{title.parameterize}-#{event_date}" if title
  end

  def update_image
    update(image_path: upload_image.url)
  end

end
