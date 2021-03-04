# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  genre      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord

  has_many(:follows, { :class_name => "Follow", :foreign_key => "artist_id", :dependent => :destroy })

  has_many(:concerts, { :class_name => "Concert", :foreign_key => "artist_id", :dependent => :destroy })

end
