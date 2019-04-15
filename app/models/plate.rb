# == Schema Information
#
# Table name: plates
#
#  id         :bigint(8)        not null, primary key
#  color      :string
#  dancing    :boolean
#  fancy      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plate < ApplicationRecord

  has_one :level_item, :foreign_key => "item_id", :dependent => :destroy
  has_one :level, :through => :level_item, :source => :level
end
