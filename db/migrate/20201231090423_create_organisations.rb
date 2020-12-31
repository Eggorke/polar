class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|

      t.string :name
      t.string :director
      t.string :phone
      t.string :note

      t.timestamps
    end

  end
end
