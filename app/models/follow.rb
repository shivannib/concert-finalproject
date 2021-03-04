# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  user_id    :integer
#
class Follow < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:artist, { :required => false, :class_name => "Artist", :foreign_key => "artist_id" })
  
end
