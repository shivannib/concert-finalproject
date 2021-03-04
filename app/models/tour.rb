# == Schema Information
#
# Table name: tours
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tour < ApplicationRecord

  has_many(:concerts, { :class_name => "Concert", :foreign_key => "tour_id", :dependent => :destroy })
  
end
