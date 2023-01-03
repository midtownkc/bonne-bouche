# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/index' do
  before do
    assign(:recipes, [
             Recipe.create!(
               title: 'Title',
               prep_time_hours: 2,
               prep_time_minutes: 3,
               cook_time_hours: 4,
               cook_time_minutes: 5,
               serving_size: 'Serving Size',
               servings: 6,
               instruction_video: 'Instruction Video',
               short_description: 'Short Description',
               instructions: 'Cook a bunch of stuff'
             ),
             Recipe.create!(
               title: 'Title',
               prep_time_hours: 2,
               prep_time_minutes: 3,
               cook_time_hours: 4,
               cook_time_minutes: 5,
               serving_size: 'Serving Size',
               servings: 6,
               instruction_video: 'Instruction Video',
               short_description: 'Short Description',
               instructions: 'Cook a bunch of stuff'
             )
           ])
  end

  it 'renders a list of recipes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Serving Size'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Instruction Video'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Short Description'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Instructions'.to_s), count: 2
  end
end
