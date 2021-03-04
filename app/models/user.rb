# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  artist          :boolean
#  email           :string
#  home_city       :string
#  name            :string
#  password_digest :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:follows, { :class_name => "Follow", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:interests, { :class_name => "Interest", :foreign_key => "user_id", :dependent => :destroy })
end
