class TodoLists::CLI

  attr_reader :lists_controller
  def initialize
    @lists_controller = TodoLists::ListsController.new
    @items_controller = TodoLists::ItemsController.new
  end


  def call
    if TodoLists::List.count == 0
      lists_controller.new
    else
      lists_menu  # only list menu if a list was created
    end
  end

  def lists_menu
    lists_controller.index
    until lists_controller.last_input == '/exit'

      puts 'Enter list number or \'/help\' for more options or type /exit'

      lists_controller.get_input

      last_input = lists_controller.last_input.downcase

      if last_input.to_i > 0
        @list = TodoLists::List.find_by_id(last_input)
        items_menu(@list) if @list

      elsif last_input == '/new'
        lists_controller.new

      elsif last_input.match?(/\/edit\s\d+/)
        lists_controller.edit
        lists_controller.index

      elsif last_input.match?(/\/delete\s\d+/)
        lists_controller.delete
        lists_controller.index

      elsif last_input == '/index'
        lists_controller.index

      elsif last_input == '/help'
        lists_controller.help
      end

    end
  end

  def items_menu
    @list
  end

end
