class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :payment_detials, :payment_details
  end
end
