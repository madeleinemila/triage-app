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
  has_and_belongs_to_many :issues
  has_many :technologies, :through => "issues"
  include PgSearch
  pg_search_scope :search_by_title_and_steps, against: [:title, :steps],
    using: {
      tsearch: {
        prefix: true,
        any_word: true,
        dictionary: "english"
      }
    }
end
