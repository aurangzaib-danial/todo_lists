class TodoLists::ItemsController

  attr_accessor :list, :last_input

  Item = TodoLists::Item

  def help
    puts "\nOptions available"
    puts '/index (list all items)'
    puts '/edit {item_id}'
    puts '/delete {item_id}'
    puts '/done {item_id} (mark item complete)'
    puts '/exit'
    puts
  end

  def done
    item_index = last_input.split(' ')[1]
    item = Item.find_by_index_and_list_id(index: item_index, list_id: list.id)
    if item
      item.done = true
      item.save
    end
  end

  def edit
    item_index = last_input.split(' ')[1]
    item = Item.find_by_index_and_list_id(index: item_index, list_id: list.id)
    if item
      print 'Enter new content: '
      get_input
      item.content = last_input
      item.save
    end
  end

  def delete
    item_index = last_input.split(' ')[1]
    item = Item.find_by_index_and_list_id(index: item_index, list_id: list.id)
    if item
      print 'Are you sure? Enter \'y/n\': '
      get_input

      if last_input.downcase == 'y'
        item.destroy
      end

    end
  end

  def index
    if list.items.count == 0
      puts "\nYou have no items in '#{@list.title.capitalize}'."
    else
      puts "\n---------------#{list.title.capitalize}---------------"
      puts '#   item'
      puts '--   -----'
      list.items.reload.each.with_index(1) do |item, index|
        puts "#{index}: #{item.content.capitalize} [#{'X' if item.done?}]"
      end
    end
  end

  def new

    item = Item.new(list: list, content: last_input)

    item.save
  end

  def get_input
    @last_input = gets.strip
  end
end
