class AddVotes < ActiveRecord::Migration
  def change
    add_column :questions, :yes, :integer, default: 0
    add_column :questions, :no, :integer, default: 0
  end
end
