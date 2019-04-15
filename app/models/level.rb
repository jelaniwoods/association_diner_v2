# == Schema Information
#
# Table name: levels
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Level < ApplicationRecord
  has_many :answers, :dependent => :destroy
  has_many :level_items, :dependent => :destroy

  has_many :plates, :through => :level_items, :source => :plate
  has_many :fruits, :through => :level_items, :source => :fruit

end
