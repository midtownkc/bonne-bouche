# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/new' do
  before do
    assign(:recipe, Recipe.new(
                      title: 'MyString',
                      prep_time_hours: 1,
                      prep_time_minutes: 1,
                      cook_time_hours: 1,
                      cook_time_minutes: 1,
                      serving_size: 'MyString',
                      servings: 1,
                      instruction_video: 'MyString',
                      short_description: 'MyString',
                      instructions: 'Cook a bunch of stuff'
                    ))
  end

  it 'renders new recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipes_path, 'post' do
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
