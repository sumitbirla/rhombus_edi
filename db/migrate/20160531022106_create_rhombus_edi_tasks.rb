class CreateRhombusEdiTasks < ActiveRecord::Migration
  def change
    create_table :edi_tasks do |t|
      t.string :task_type, null: false
      t.boolean :active, null: false, default: true
      t.integer :affiliate_id, null: false
      t.integer :edi_ftp_server_id, null: false
      t.string :document_type, null: false
      t.string :source_directory, null: false
      t.string :source_filemask, null: false
      t.string :destination_directory, null: false
      t.string :notify_email
      t.integer :printer_id
      t.datetime :last_executed
      t.text :last_status

      t.timestamps null: false
    end
  end
end
