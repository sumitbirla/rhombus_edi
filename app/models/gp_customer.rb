class GpCustomer < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "RM00101"
	self.primary_key = "CUSTNMBR"
end
