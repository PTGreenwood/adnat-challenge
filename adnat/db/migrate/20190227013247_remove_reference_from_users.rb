class RemoveReferenceFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :organisation_id
  end
end
