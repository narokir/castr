class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :company_name
      t.datetime :listing_expires
      t.string :url
      t.string :union_status
      t.string :payment
      t.text :payment_detials
      t.datetime :shoot_date
      t.boolean :featured, default: false
      t.string :status, default: "pending"
      t.string :shoot_location
      t.text :special_instructions
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
