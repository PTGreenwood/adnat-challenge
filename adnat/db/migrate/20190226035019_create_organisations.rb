class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.text :name
      t.float :hourly_rate

      t.timestamps
    end
  end
end
