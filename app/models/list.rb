# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string
#  category   :string
#  prioriti   :integer
#  duedate    :datetime
#  status     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord
    validates :name, :presence => true
    validates :prioriti, :numericality => { :only_integer => true}
    
    belongs_to :user
    has_many :tasks, :dependent => :destroy
    has_many :collaborations, :dependent => :destroy
    has_many :collaborators, :through => :collaborations, :source => :user
    
end
