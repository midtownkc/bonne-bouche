# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe do
  describe 'validations' do
    let(:recipe) { build(:recipe) }

    it 'is valid with valid attributes' do
      expect(recipe).to be_valid
    end

    it 'is not valid without a title' do
      # Test presence validation for title
      recipe.title = nil
      expect(recipe).not_to be_valid
    end

    it 'is not valid without instructions' do
      # Test presence validation for instructions
      recipe.instructions = nil
      expect(recipe).not_to be_valid
    end

    it 'is not valid with a title longer than 100 characters' do
      # Test length validation for title
      recipe.title = Faker::Lorem.characters(number: 101)
      expect(recipe).not_to be_valid
    end

    it 'is not valid with a serving size longer than 100 characters' do
      # Test length validation for serving_size
      recipe.serving_size = Faker::Lorem.characters(number: 101)
      expect(recipe).not_to be_valid
    end

    it 'is not valid with a short description longer than 300 characters' do
      # Test length validation for short_description
      recipe.short_description = Faker::Lorem.characters(number: 301)
      expect(recipe).not_to be_valid
    end
  end
end
