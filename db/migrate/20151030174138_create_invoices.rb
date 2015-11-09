class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
    	t.string :number
    	t.string :supplier
    	t.string :taxCode
    	t.date :paymentDate
    	t.date :receiptDate

    	t.timestamps
    end
  end
end
