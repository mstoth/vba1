class CreateConcerts < ActiveRecord::Migration[7.1]
  def change
    create_table :concerts do |t|
      t.string :title
      t.integer :group_id
      t.integer :venue_id
      t.datetime :date

      t.timestamps
    end
  end
end
