class AddPersonasToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :admin, :boolean, default: false
    add_column :members, :castr, :boolean, default: false
    add_column :members, :talent, :boolean, default: false
  end
end
