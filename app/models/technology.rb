# == Schema Information
#
# Table name: technologies
#
#  id         :integer          not null, primary key
#  name       :text
#  links      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Technology < ApplicationRecord
end
