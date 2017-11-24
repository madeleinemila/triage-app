# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  summary    :text
#  details    :text
#  popularity :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Issue < ApplicationRecord
  has_and_belongs_to_many :fixes
  has_and_belongs_to_many :technologies
end
