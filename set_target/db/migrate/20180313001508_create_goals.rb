class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :details
      t.boolean :private
      t.boolean :completed
      t.integer :user_id

      t.timestamps
    end
  end
end
