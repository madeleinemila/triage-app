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
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  # validates_presence_of :password_confirmation, :if => :password_digest_changed? # CHANGED
end
