class CreateCostCenters < ActiveRecord::Migration
  def change
    create_table :costcenters do |t|
    	t.string :name
    	t.string :number
      t.integer :organization_id

    	t.timestamps
    end
  end
end
