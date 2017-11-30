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
  has_and_belongs_to_many :issues
  has_many :fixes, :through => "issues"
  include PgSearch
  pg_search_scope :search_by_name, against: :name,
    using: {
      tsearch: {
        prefix: true
      },
      trigram: {}
    }
  multisearchable :against => [:name]
end
