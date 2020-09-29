class AddPaymentRateToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :pay_interval, :string
  end
end
