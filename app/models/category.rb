class Category < ApplicationRecord
  has_many :events
  has_many :venues, through: :events
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  before_validation :create_slug

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = title.parameterize if title
  end
end
