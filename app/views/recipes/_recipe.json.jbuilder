# frozen_string_literal: true

json.extract! recipe, :id, :title, :prep_time_hours, :prep_time_minutes, :cook_time_hours, :cook_time_minutes,
              :serving_size, :servings, :instruction_video, :short_description, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
