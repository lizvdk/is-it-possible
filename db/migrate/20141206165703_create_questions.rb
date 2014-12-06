class CreateQuestions < ActiveRecord::Migration
  def change
    # Create the questions table with the following
    create_table :questions do |table|
      # A column question of type string
      table.string :question

      # A column last_name of type string
      table.string :season

      # A column phone_number of type string
      table.string :episode
    end
  end
end
