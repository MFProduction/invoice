class ChangeAmountToMoney < ActiveRecord::Migration
  def change
  	add_monetize :invoices, :amount
  end
end
