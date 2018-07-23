class GpUnpostedTransaction < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "SOP10100"
	self.primary_key = "SOPNUMBE"
end
