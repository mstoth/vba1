class CreatePieces < ActiveRecord::Migration[7.1]
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :composer
      t.integer :concert_id
      t.integer :length

      t.timestamps
    end
  end
end
