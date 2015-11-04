class CreateAnalyticsTable < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
    	t.string :name
    	t.integer :number

    	t.timestamps
    end
  end
end
