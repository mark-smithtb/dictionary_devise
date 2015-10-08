class Definition < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :meaning, presence: true
  has_many :examples
  accepts_nested_attributes_for :examples
  paginates_per 10
  def self.search(search)
    where("word LIKE ? OR meaning LIKE ?" , "%#{search}%" , "%#{search}%")
  end

  def fancy?
    self.word.length > 16
  end

end
