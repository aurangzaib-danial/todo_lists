class TodoLists::List < ActiveRecord::Base
  has_many :items
end
