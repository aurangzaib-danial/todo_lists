class TodoLists::List < ActiveRecord::Base
  has_many :items
  validates :title, :presence => true

  def self.find_by_index(index)
    all[index.to_i-1]
  end
end
