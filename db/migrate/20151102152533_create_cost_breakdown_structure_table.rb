class CreateCostBreakdownStructureTable < ActiveRecord::Migration
  def change
    create_table :costbreakdowns do |t|
    	t.string :name
    	t.string :number

    	t.timestamps
    end
  end
end
