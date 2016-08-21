class Venue < ApplicationRecord
  has_many :events
  has_many :categories, through: :events
  belongs_to :admin, class_name: "User", foreign_key: :user_id
  validates :name, presence: true, uniqueness: true
  validates :image_path, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  before_validation :create_slug

  def location
    "#{city}, #{state}"
  end

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = name.parameterize if name
  end
end
