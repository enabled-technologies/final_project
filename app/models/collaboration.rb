# == Schema Information
#
# Table name: collaborations
#
#  id         :integer          not null, primary key
#  list_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collaboration < ApplicationRecord
    validates :user_id, :presence => true
    validates :list_id, :presence =>true
    
    belongs_to :user, :required => false
    belongs_to :list
end
