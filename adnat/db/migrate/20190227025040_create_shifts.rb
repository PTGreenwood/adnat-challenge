class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.references :user, foreign_key: true
      t.datetime :start
      t.datetime :finish
      t.integer :breaklength

      t.timestamps
    end
  end
end
