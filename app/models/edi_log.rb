class EdiLog < ActiveRecord::Base
  belongs_to :edi_task
  validates_presence_of :timestamp, :edi_task_id, :result

  # PUNDIT
  def self.policy_class
    ApplicationPolicy
  end
end
