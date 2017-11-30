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
  # TODO validations
  has_and_belongs_to_many :fixes
  has_and_belongs_to_many :technologies
  include PgSearch
  pg_search_scope :search_full_text,
    against: {
      summary: 'A',
      details: 'B'
    },
    using: {
      tsearch: {
        prefix: true,
        dictionary: "english"
      },
      trigram: {threshold:  0.1}
    }
  multisearchable :against => [:summary]
end
