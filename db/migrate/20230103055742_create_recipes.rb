class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :prep_time_hours
      t.integer :prep_time_minutes
      t.integer :cook_time_hours
      t.integer :cook_time_minutes
      t.string :serving_size
      t.integer :servings
      t.string :instruction_video
      t.string :short_description

      t.timestamps
    end
  end
end
