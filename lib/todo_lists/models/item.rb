class TodoLists::Item < ActiveRecord::Base
  belongs_to :list
  validates :content, :presence => :true

  def self.find_by_index_and_list_id(index:, list_id:)
    where(:list_id => list_id)[index.to_i-1]
  end
end
