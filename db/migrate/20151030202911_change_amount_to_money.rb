class ChangeAmountToMoney < ActiveRecord::Migration
  def change
  	   add_money :invoices, :amount
  end
end
