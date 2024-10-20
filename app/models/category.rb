class Category < ApplicationRecord
  has_rich_text :description
  has_one_attached :images
end
