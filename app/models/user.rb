# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord
  has_secure_password
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :length => { :minimum => 6 }
end
