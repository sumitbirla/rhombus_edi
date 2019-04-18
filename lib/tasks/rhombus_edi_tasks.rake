require 'net/sftp'

namespace :rhombus_edi do
  
  desc "Perform EDI file transfers and notifications"
  task file_transfers: :environment do
    @logger = Logger.new(Rails.root.join("log", "edi.log"))
    
    ftp_servers = EdiFtpServer.joins(:edi_tasks).where("edi_tasks.active=1").distinct
    
    ftp_servers.each do |srv|
      @logger.debug "Connecting to #{srv} ..."
      
      Net::SFTP.start(srv.hostname, srv.username, :password => srv.password) do |sftp|
        @logger.debug "Connected"
        srv.update(last_status: :ok)
        
        EdiTask.where(edi_ftp_server_id: srv.id, active: true, task_type: :download).each do |t|
          @logger.debug "TASK #{t.id}: #{t.task_type}: #{t.source_directory} -> #{t.destination_directory}"
          
          sftp.dir.foreach(t.source_directory) do |entry|
              @logger.debug entry.longname
              #sftp.download!(entry.longname, t.destination_directory)
              #sftp.remove(entry.longname)
          end
        end
      end
      
    end
    
    @logger.debug "Finished."
  end
  
end
  