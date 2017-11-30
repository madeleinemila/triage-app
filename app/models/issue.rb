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

  validates :summary, :presence => true
  validate :must_have_one_tech

  def must_have_one_tech
    errors.add(:base, 'Please select at least one associated technology') if self.technologies.blank?
  end

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
