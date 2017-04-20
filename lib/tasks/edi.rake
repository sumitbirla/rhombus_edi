namespace :edi do
  
  # Process a single task (upload or download).  Expects an open connection (sftp)
  def process_task(sftp, t)
    
    if t.task_type == 'download' 
      
      sftp.dir.foreach(t.source_directory) do |entry|
        @logger.debug "Downloading #{t.source_directory}/#{entry.name}"
        
		dst_path = t.destination_directory + "/" + entry.name
        sftp.download!(t.source_directory + "/" + entry.name, dst_path)
        sftp.remove(t.source_directory + "/" + entry.name)
        system "chown ftp:ftp #{dst_path}"

		@logger.debug "Deleted #{entry.name} from server"
      end
      
    elsif t.task_type == 'upload'
      Dir.glob(t.source_directory + "/" + t.source_filemask).each do |f|
        @logger.debug "Uploading " + f
        
		sftp.upload!(f, t.destination_directory + "/" + f.split("/").last)
        FileUtils.mv f, t.source_directory + "/history/"
		
		@logger.debug "Moved #{f} to history/"
      end
    end

  end
  
  # Process tasks for a single SFTP server
  def process_server(srv)
    Net::SFTP.start(srv.hostname, srv.username, :password => srv.password) do |sftp|
      srv.update(last_status: :ok)
      
      EdiTask.where(edi_ftp_server_id: srv.id, active: true).each do |t|
        begin 
          process_task(sftp, t)
		  t.update_attributes(last_executed: DateTime.now, last_status: :ok)
        rescue => e
          @logger.error e
		  t.update_attributes(last_executed: DateTime.now, last_status: e.message)
        end
      end
    end
  end
  
  
  desc "Perform EDI file transfers and notifications"
  task tasks: :environment do
    
    @logger = Logger.new(Rails.root.join("log", "edi.log"))
    @logger.debug "Running..."

    ftp_servers = EdiFtpServer.joins(:edi_tasks).where("edi_tasks.active=1").uniq
    ftp_servers.each do |srv|
      begin
        process_server(srv)
		srv.update_attribute(:last_status, :ok)
      rescue => e
        @logger.error e
        srv.update_attribute(:last_status, e.message)
      end
    end

  end

end
