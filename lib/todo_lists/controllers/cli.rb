class TodoLists::CLI

  attr_reader :lists_controller
  def initialize
    @lists_controller = TodoLists::ListsController.new
  end


  def call

    if TodoLists::List.count == 0
      puts 'You have no TodoList, create one or type \'/exit\''
      lists_controller.new

      menu if TodoLists::List.count == 1
    else
      menu
    end
  end

  def menu
    lists_controller.index
    until lists_controller.last_input == '/exit'

      puts 'Enter list number or \'/help\' for more options or type /exit'

      lists_controller.get_input

      last_input = lists_controller.last_input.downcase

      if last_input.to_i > 0
        lists_controller.show

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

end
