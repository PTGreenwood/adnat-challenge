class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :organisation_id, foreign_key: true
      t.text :name
      t.text :email
      t.text :password

      t.timestamps
    end
  end
end
