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

  validates :summary, :presence => true, :uniqueness => true
  validate :must_have_one_tech
  validate :no_xss

  def must_have_one_tech
    errors.add(:base, 'Please select at least one associated technology. If the tech is not listed, please <a href="/technologies/new">create it</a> first.') if self.technologies.blank?
  end

  def no_xss
    xss_present = false
    xss_present = true if /<script>/i =~ self.details
    xss_present = true if /<\/script>/i =~ self.details
    xss_present = true if /javascript\:/i =~ self.details
    xss_present = true if /<%/i =~ self.details
    xss_present = true if /%>/i =~ self.details
    errors.add(:base, "Your entry resembles a code injection attack. Please remove embedded script tags (and don't be evil).") if xss_present
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
