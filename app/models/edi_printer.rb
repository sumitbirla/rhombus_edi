# == Schema Information
#
# Table name: edi_printers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  hostname   :string(255)      not null
#  port       :integer          not null
#  location   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EdiPrinter < ActiveRecord::Base
  self.table_name = "edi_printers"
  validates_presence_of :name, :hostname, :port
  
  def to_s
    name
  end
    
end

