class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :user, foreign_key: true
      t.string :movie_id
      t.integer :duration_of_party
      t.datetime :start_time
      t.datetime :end_time
      t.integer :attendees, array: true

      t.timestamps
    end
     add_index :users, :id
  end
end
