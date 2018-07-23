class GpItem < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "IV00101"
	self.primary_key = "ITEMNMBR"
end
