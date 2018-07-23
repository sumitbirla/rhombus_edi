class GpEmail < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "RMEMAIL"
	self.primary_key = "CUSTNMBR"
end
