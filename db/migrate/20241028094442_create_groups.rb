class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :contact
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
