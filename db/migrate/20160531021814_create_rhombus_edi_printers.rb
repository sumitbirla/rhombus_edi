class CreateRhombusEdiPrinters < ActiveRecord::Migration
  def change
    create_table :edi_printers do |t|
      t.string :name, null: false
      t.string :hostname, null: false
      t.integer :port, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end
