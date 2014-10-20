class AddRemainingVotesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remaining_votes, :integer, default: 5
  end
end
