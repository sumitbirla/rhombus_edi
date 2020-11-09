class Admin::EdiTasksController < Admin::BaseController
  def index
    authorize EdiTask.new
    @edi_tasks = EdiTask.paginate(page: params[:page], per_page: @per_page).order(:affiliate_id)
  end

  def new
    @edi_task = authorize EdiTask.new(task_type: :download)
    render 'edit'
  end

  def create
    @edi_task = authorize EdiTask.new(edi_task_params)

    if @edi_task.save
      Rails.cache.delete :edi_tasks
      redirect_to action: 'index', notice: 'Task was successfully created.'
    else
      render 'edit'
    end
  end

  def show
    @edi_task = authorize EdiTask.find(params[:id])
  end

  def edit
    @edi_task = authorize EdiTask.find(params[:id])
  end

  def update
    @edi_task = authorize EdiTask.find(params[:id])

    if @edi_task.update(edi_task_params)
      redirect_to action: 'index', notice: 'Task was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @edi_task = authorize EdiTask.find(params[:id])
    @edi_task.destroy

    redirect_to action: 'index', notice: 'Task has been deleted.'
  end


  private

  def edi_task_params
    params.require(:edi_task).permit!
  end
end
