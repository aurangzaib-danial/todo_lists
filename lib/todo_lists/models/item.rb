class TodoLists::Item < ActiveRecord::Base
  belongs_to :list
end
