class Admin::EdiLogsController < Admin::BaseController
  
  def index
    @edi_logs = EdiLog.includes(:edi_task, edi_task: :affiliate).order(sort_column + ' ' + sort_direction)
    
    respond_to do |format|
      format.html { @edi_logs = @edi_logs.page(params[:page]) }
      format.csv { send_data "Not Implemented" }
    end
  end

  def show
  end
  
  
  private
  
    def sort_column
      params[:sort] || "timestamp"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
  
end
