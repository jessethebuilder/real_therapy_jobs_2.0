class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.integer :contact_id
      t.integer :company_id
      t.string :setting


      t.timestamps
    end
  end
end
