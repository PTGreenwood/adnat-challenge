class AddOrganisationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :organisation_id, foreign_key: true
  end
end
