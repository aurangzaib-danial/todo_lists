class TodoLists::ItemsController

  attr_reader :last_input
  attr_accessor :list

  Item = TodoLists::Item

  def help
    puts "\nOptions available"
    puts '/index (list all items)'
    puts '/edit {item_id}'
    puts '/delete {item_id}'
    puts '/done {item_id} (mark item complete)'
    puts
  end

  def edit
    list_id = last_input.split(' ')[1]
    list = List.find_by_id(list_id)
    if list
      print 'Enter new title: '
      get_input
      list.title = last_input
      list.save
    end
  end

  def delete
    list_id = last_input.split(' ')[1]
    list = List.find_by_id(list_id)
    if list
      print 'Are you sure? Enter \'y/n\': '
      get_input

      if last_input.downcase == 'y'
        list.destroy
      end

    end
  end

  def index
    puts
    puts "---------------#{list.title.capitalize}---------------"
    puts 'id   item'
    puts '--   -----'
    list.items.each do |item|
      puts "#{item.id}: #{item.content.capitalize}"
    end
  end

  def new

    puts "\nYou have no items in '#{list.title.capitalize}', create one or type \'/exit\'" if list.items.count == 0

    print 'Enter item content: '
    get_input

    return if last_input == '/exit'

    item = Item.new(content: last_input, list: list)

    if item.valid? and
      item.save
    else
      new
    end
  end

  def get_input
    @last_input = gets.strip
  end
end
