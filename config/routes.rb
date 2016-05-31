Rails.application.routes.draw do
  
  namespace :admin do
    resources :edi_ftp_servers
    resources :edi_printers
    resources :edi_tasks
  end

end
