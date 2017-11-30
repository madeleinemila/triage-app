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

  validates :title, :presence => true
  validates :steps, :presence => true
  validate :must_have_an_issue

  def must_have_an_issue
    errors.add(:base, 'Please select a related issue. If this fix relates to a new issue, please <a href="/issues/new">create a new issue</a> first.') if self.issues.blank?
  end

  include PgSearch
  pg_search_scope :search_full_text,
    against: {
      title: 'A',
      steps: 'B'
    },
    using: {
      tsearch: {
        prefix: true,
        dictionary: "english"
      },
      trigram: {threshold:  0.1}
    }
  multisearchable :against => [:title]
end
