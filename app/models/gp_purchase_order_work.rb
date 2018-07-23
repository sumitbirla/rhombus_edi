class GpPurchaseOrderWork < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "POP10100"
	self.primary_key = "PONUMBER"
end
