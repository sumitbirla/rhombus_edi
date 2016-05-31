# == Schema Information
#
# Table name: edi_schedules
#
#  id                    :integer          not null, primary key
#  task_type             :string(255)      default(""), not null
#  affiliate_id          :integer          not null
#  edi_ftp_server_id     :integer          not null
#  source_directory      :string(255)      not null
#  source_filemask       :string(255)      not null
#  destination_directory :string(255)      not null
#  notify_email          :string(255)
#  edi_printer_id        :integer
#  last_executed         :datetime
#  last_status           :text(65535)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class EdiTask < ActiveRecord::Base
  self.table_name = "edi_schedules"
  belongs_to :affiliate
  belongs_to :edi_ftp_server
  belongs_to :edi_printer
  validates :task_type, inclusion: { in: %w(download upload),
      message: "%{value} is not a valid task" }
end

