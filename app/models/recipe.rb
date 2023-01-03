# frozen_string_literal: true

# Recipes for food
class Recipe < ApplicationRecord
  has_rich_text :instructions

  validates :title, :instructions, presence: true
  validates :title, :serving_size, length: { maximum: 100 }
  validates :short_description, length: { maximum: 300 }
end
