# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/edit' do
  let(:recipe) do
    Recipe.create!(
      title: 'MyString',
      prep_time_hours: 1,
      prep_time_minutes: 1,
      cook_time_hours: 1,
      cook_time_minutes: 1,
      serving_size: 'MyString',
      servings: 1,
      instruction_video: 'MyString',
      short_description: 'MyString',
      instructions: 'Cook the food dude'
    )
  end

  before do
    assign(:recipe, recipe)
  end

  it 'renders the edit recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipe_path(recipe), 'post' do
      assert_select 'input[name=?]', 'recipe[title]'

      assert_select 'input[name=?]', 'recipe[prep_time_hours]'

      assert_select 'input[name=?]', 'recipe[prep_time_minutes]'

      assert_select 'input[name=?]', 'recipe[cook_time_hours]'

      assert_select 'input[name=?]', 'recipe[cook_time_minutes]'

      assert_select 'input[name=?]', 'recipe[serving_size]'

      assert_select 'input[name=?]', 'recipe[servings]'

      assert_select 'input[name=?]', 'recipe[instruction_video]'

      assert_select 'input[name=?]', 'recipe[short_description]'

      assert_select 'input[name=?]', 'recipe[instructions]'
    end
  end
end
