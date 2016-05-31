class Admin::EdiPrintersController < Admin::BaseController
  def index
    @edi_printers = EdiPrinter.page(params[:page]).order('name')
  end

  def new
    @edi_printer = EdiPrinter.new name: 'New edi_printer'
    render 'edit'
  end

  def create
    @edi_printer = EdiPrinter.new(edi_printer_params)
    
    if @edi_printer.save
      Rails.cache.delete :edi_printers
      redirect_to action: 'index', notice: 'Printer was successfully created.'
    else
      render 'edit'
    end
  end

  def show
    @edi_printer = EdiPrinter.find(params[:id])
  end

  def edit
    @edi_printer = EdiPrinter.find(params[:id])
  end

  def update
    @edi_printer = EdiPrinter.find(params[:id])
    
    if @edi_printer.update(edi_printer_params)
      redirect_to action: 'index', notice: 'Printer was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @edi_printer = EdiPrinter.find(params[:id])
    @edi_printer.destroy
    
    redirect_to action: 'index', notice: 'Printer has been deleted.'
  end
  
  
  private
  
    def edi_printer_params
      params.require(:edi_printer).permit!
    end
end
