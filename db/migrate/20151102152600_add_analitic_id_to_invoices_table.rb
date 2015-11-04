class AddAnaliticIdToInvoicesTable < ActiveRecord::Migration
  def change
  	add_column :invoices, :analytic_id, :integer
  	add_column :invoices, :costbreakdown_id, :integer
  end
end
