# == Schema Information
#
# Table name: level_items
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  level_id   :integer
#

class LevelItem < ApplicationRecord
  belongs_to :level
  belongs_to :plate, :required => false, :foreign_key => "item_id"
  belongs_to :fruit, :required => false, :foreign_key => "item_id"
  # belongs_to :bento, :foreign_key => "item_id"
end
