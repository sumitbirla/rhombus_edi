# == Schema Information
#
# Table name: edi_ftp_servers
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  hostname    :string(255)      not null
#  port        :integer          not null
#  username    :string(255)      not null
#  password    :string(255)      not null
#  protocol    :string(255)      not null
#  last_status :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EdiFtpServer < ActiveRecord::Base
  self.table_name = "edi_ftp_servers"
  has_many :edi_tasks
  validates_presence_of :name, :hostname, :port, :username, :password, :protocol
  validates :protocol, inclusion: {in: %w(ftp sftp ftps),
                                   message: "%{value} is not a valid protocol"}

  def to_s
    "#{protocol}://#{username}@#{hostname}:#{port}"
  end

  # PUNDIT
  def self.policy_class
    ApplicationPolicy
  end
end

