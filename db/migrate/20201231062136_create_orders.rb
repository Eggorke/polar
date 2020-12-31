class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :note
      t.string :client_organisation
      t.references :users
      t.timestamps
    end
  end
end
