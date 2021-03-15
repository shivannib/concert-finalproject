# == Schema Information
#
# Table name: concerts
#
#  id         :integer          not null, primary key
#  city       :string
#  date       :datetime
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  tour_id    :integer
#
class Concert < ApplicationRecord

  has_many(:interests, { :class_name => "Interest", :foreign_key => "concert_id", :dependent => :destroy })

  belongs_to(:artist, { :required => false, :class_name => "Artist", :foreign_key => "artist_id" })

  belongs_to(:tour, { :required => false, :class_name => "Tour", :foreign_key => "tour_id" })  

end
