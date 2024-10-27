class Product < ApplicationRecord
  has_rich_text :description
  has_many_attached :images
  belongs_to :category, optional: true  # Without "optional: true" it will be mandatory to belong to category
  has_many :cart_items, dependent: :destroy # Deletes all cart_items associated when a product is deleted. this to resolve error: PG::ForeignKeyViolation
end
