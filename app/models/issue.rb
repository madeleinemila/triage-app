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
end
