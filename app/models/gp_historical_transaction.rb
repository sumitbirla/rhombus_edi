class GpHistoricalTransaction < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "SOP30200"
	self.primary_key = "SOPNUMBE"
end
