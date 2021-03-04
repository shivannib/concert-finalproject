# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  concert_id :integer
#  user_id    :integer
#
class Interest < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:concert, { :required => false, :class_name => "Concert", :foreign_key => "concert_id" })
  
end
