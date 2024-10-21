class Product < ApplicationRecord
  has_rich_text :description
  has_many_attached :images
  belongs_to :category, optional: true  #Without optional: true it will be mandatory to belong to category
end
