class TodoLists::ListController

  attr_reader :last_input

  List = TodoLists::List
  Item = TodoLists::Item

  def help
    puts "\nOptions available"
    puts '/index (lists all TodoLists)'
    puts '/new (for a new list)'
    puts '/edit {list_number}'
    puts '/delete {list_number}'
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

  def show
    @list = List.find_by_id(last_input)
    items_menu if @list
  end

  def index
    puts
    puts '---------------TodoLists---------------'
    puts 'id   title'
    puts '--   -----'
    List.all.each do |list|
      puts "#{list.id}: #{list.title.capitalize}"
    end
  end

  def new
    print 'Enter Title: '
    get_input

    return if last_input == '/exit'

    list = List.new(title: last_input)

    if list.valid? and
      list.save
    else
      new
    end
  end

  def get_input
    @last_input = gets.strip
  end
end
