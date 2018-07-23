class GpHistoricalTransactionItem < ActiveRecord::Base
	establish_connection "gp_#{Rails.env}".to_sym
	self.table_name = "SOP30300"
	self.primary_key = "ITEMNMBR"
end
