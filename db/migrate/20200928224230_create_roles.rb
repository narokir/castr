class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.text :role_description
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
