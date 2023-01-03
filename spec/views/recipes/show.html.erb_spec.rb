# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/show' do
  before do
    assign(:recipe, Recipe.create!(
                      title: 'Title',
                      prep_time_hours: 2,
                      prep_time_minutes: 3,
                      cook_time_hours: 4,
                      cook_time_minutes: 5,
                      serving_size: 'Serving Size',
                      servings: 6,
                      instruction_video: 'Instruction Video',
                      short_description: 'Short Description',
                      instructions: 'Cook the food a bunch'
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Serving Size/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/Instruction Video/)
    expect(rendered).to match(/Short Description/)
    expect(rendered).to match(/Instructions/)
  end
end
