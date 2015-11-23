class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
    	t.string :name
      t.string :schema_name
    	t.timestamps
    end
  end
end
