class AddAnaliticIdToInvoicesTable < ActiveRecord::Migration
  def change
  	add_column :invoices, :analytic_id, :integer
  	add_column :invoices, :costcenter_id, :integer
  end
end
