# == Schema Information
#
# Table name: fruits
#
#  id         :bigint(8)        not null, primary key
#  dancing    :boolean
#  name       :string
#  size       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fruit < ApplicationRecord
  has_one :level_item, :foreign_key => "item_id", :dependent => :destroy
  has_one :level, :through => :level_item, :source => :level

end
