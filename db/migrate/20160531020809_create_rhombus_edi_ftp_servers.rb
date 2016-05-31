class CreateRhombusEdiFtpServers < ActiveRecord::Migration
  def change
    create_table :edi_ftp_servers do |t|
      t.string :name, null: false
      t.string :hostname, null: false
      t.integer :port, null: false
      t.string :username, null: false
      t.string :password, null: false
      t.string :protocol, null: false
      t.text :last_status

      t.timestamps null: false
    end
  end
end
