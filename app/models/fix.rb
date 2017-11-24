# == Schema Information
#
# Table name: fixes
#
#  id         :integer          not null, primary key
#  title      :text
#  steps      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fix < ApplicationRecord
end
