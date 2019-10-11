class TodoLists::CLI

  List = TodoLists::List
  Item = TodoLists::Item

  attr_reader :last_input

  def call
    if List.count == 0
      puts 'You have no TodoList, create one'
      list_new
    else
      menu
    end
  end

  def menu
  end

  def list_new
    print 'Enter Title: '
    get_input

    list = List.new(title: last_input)

    if list.valid?
      list.save
    else
      puts 'do something'
    end
  end

  def get_input
    @last_input = gets.strip
  end
end
