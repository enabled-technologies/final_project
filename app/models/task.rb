# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  prioriti   :integer
#  duedate    :datetime
#  status     :string
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord
    validates :name, :presence => true
    validates :prioriti, :numericality => { :only_integer => true}

    belongs_to :list
    has_many :subtasks, :dependent => :destroy
end
