class Employee < ApplicationRecord
  include PgSearch
  belongs_to :department
  validates :name, presence: true

  pg_search_scope :search_for, against: %i[name],
                               using: { tsearch: { prefix: true } }

  def self.search(search)
    if search.present?
      search_for(search)
    else
      order('created_at ASC')
    end
  end
end
