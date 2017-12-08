# == Schema Information
#
# Table name: subtasks
#
#  id         :integer          not null, primary key
#  name       :string
#  prioriti   :integer
#  duedate    :datetime
#  status     :string
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subtask < ApplicationRecord
    validates :name, :presence => true
    validates :prioriti, :numericality => { :only_integer => true}
    
    belongs_to :task
end
