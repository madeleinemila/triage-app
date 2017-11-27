# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  favorited_type :string
#  favorited_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorited, polymorphic: true
end
