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

  validates :name, :presence => true, :uniqueness => true
  validates :links, :presence => true
  validate :no_xss


  def no_xss
    xss_present = false
    xss_present = true if /<script>/i =~ self.links
    xss_present = true if /<\/script>/i =~ self.links
    xss_present = true if /javascript\:/i =~ self.links
    xss_present = true if /<%/i =~ self.links
    xss_present = true if /%>/i =~ self.links
    errors.add(:base, "Your entry resembles a code injection attack. Please remove embedded script tags (and don't be evil).") if xss_present
  end

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
