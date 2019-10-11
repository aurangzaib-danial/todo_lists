class TodoLists::CLI

  List = TodoLists::List
  Item = TodoLists::Item

  attr_reader :last_input

  def call
    if List.count == 0
      puts 'You have no TodoList, create one or type \'/exit\''
      list_new
      menu
    else
      menu
    end
  end

  def list_help
    puts "\nOptions available"
    puts '/index (lists all TodoLists)'
    puts '/new (for a new list)'
    puts '/edit {list_number}'
    puts '/delete {list_number}'
    puts
  end


  def menu
    list_index
    until last_input == '/exit'

      puts 'Enter list number or \'/help\' for more options or type /exit'

      get_input

      last_input.downcase!

      if last_input.to_i > 0
        list_show
      elsif last_input == '/new'
        list_new
      elsif last_input.match?(/\/edit\s\d+/)
        list_edit
        list_index
      elsif last_input.match?(/\/delete\s\d+/)
        list_delete
        list_index
      elsif last_input == '/index'
        list_index
      elsif last_input == '/help'
        list_help
      end

    end
  end

  def list_edit
    list_id = last_input.split(' ')[1]
    list = List.find_by_id(list_id)
    if list
      print 'Enter new title: '
      get_input
      list.title = last_input
      list.save
    end
  end

  def list_delete
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

  def list_show
    @list = List.find_by_id(last_input)
    items_menu if @list
  end

  def list_index
    puts '---------------TodoLists---------------'
    List.all.each do |list|
      puts "#{list.id}: #{list.title.capitalize}"
    end
  end

  def list_new
    print 'Enter Title: '
    get_input

    return if last_input == '/exit'

    list = List.new(title: last_input)

    if list.valid? and
      list.save
    else
      list_new
    end
  end

  def get_input
    @last_input = gets.strip
  end
end
