class GpUnpostedTransactionItem < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "SOP10200"
	self.primary_key = "ITEMNMBR"
end
