class CreateEdiLogs < ActiveRecord::Migration
  def change
    create_table :edi_logs do |t|
      t.datetime :timestamp, null: false
      t.integer :edi_task_id, null: false
      t.string :result, null: false
      t.text :error_message
      t.string :file_path
    end
  end
end
