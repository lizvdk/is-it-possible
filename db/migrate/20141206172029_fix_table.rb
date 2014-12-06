class FixTable < ActiveRecord::Migration
  def change
    change_column(:questions, :question, :string, limit: 700)
  end
end
