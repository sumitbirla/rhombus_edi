class CreateRhombusEdiPrinters < ActiveRecord::Migration
  def change
    create_table :edi_printers do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :print_count, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end
