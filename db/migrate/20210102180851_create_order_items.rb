class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :user
      t.references :order
      t.string :place
      t.string :issue_object
      t.string :issue
      t.date :need_to

      t.timestamps
    end
  end
end
