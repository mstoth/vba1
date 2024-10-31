class CreateJoinTableUserVenue < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :venues do |t|
      # t.index [:user_id, :venue_id]
      # t.index [:venue_id, :user_id]
    end
  end
end
