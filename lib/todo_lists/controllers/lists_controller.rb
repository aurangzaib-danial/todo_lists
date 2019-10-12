class TodoLists::ListsController

  attr_accessor :last_input

  List = TodoLists::List

  def help
    puts "\nOptions available"
    puts '/new (for a new list)'
    puts '/edit {list_number}'
    puts '/delete {list_number}'
    puts
  end

  def edit
    list_index = last_input.split(' ')[1]
    list = List.find_by_index(list_index)
    if list
      print 'Enter new title: '
      get_input
      list.title = last_input
      list.save
    end
  end

  def delete
    list_index = last_input.split(' ')[1]
    list = List.find_by_index(list_index)
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
    puts '---------------TodoLists---------------'
    puts '#   title'
    puts '--   -----'
    List.all.each.with_index(1) do |list, index|
      puts "#{index}: #{list.title.capitalize}"
    end
  end

  def new

    puts 'You have no TodoList, create one or type \'/exit\'' if List.count == 0

    print 'Enter Title: '
    get_input

    return if last_input == '/exit'

    list = List.new(title: last_input)

    list.save
  end

  def get_input
    @last_input = gets.strip
  end
end
