class Admin::EdiFtpServersController < Admin::BaseController
  def index
    @edi_ftp_servers = EdiFtpServer.page(params[:page]).order('name')
  end

  def new
    @edi_ftp_server = EdiFtpServer.new(name: 'New edi_ftp_server', protocol: :sftp)
    render 'edit'
  end

  def create
    @edi_ftp_server = EdiFtpServer.new(edi_ftp_server_params)
    
    if @edi_ftp_server.save
      Rails.cache.delete :edi_ftp_servers
      redirect_to action: 'index', notice: 'FTP server was successfully created.'
    else
      render 'edit'
    end
  end

  def show
    @edi_ftp_server = EdiFtpServer.find(params[:id])
  end

  def edit
    @edi_ftp_server = EdiFtpServer.find(params[:id])
  end

  def update
    @edi_ftp_server = EdiFtpServer.find(params[:id])
    
    if @edi_ftp_server.update(edi_ftp_server_params)
      redirect_to action: 'index', notice: 'FTP server was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @edi_ftp_server = EdiFtpServer.find(params[:id])
    @edi_ftp_server.destroy
    
    redirect_to action: 'index', notice: 'FTP server has been deleted.'
  end
  
  
  private
  
    def edi_ftp_server_params
      params.require(:edi_ftp_server).permit!
    end
end
