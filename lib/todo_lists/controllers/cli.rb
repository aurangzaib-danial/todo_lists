class TodoLists::CLI

  attr_reader :list_controller
  def initialize
    @list_controller = TodoLists::ListController.new
  end


  def call

    if TodoLists::List.count == 0
      puts 'You have no TodoList, create one or type \'/exit\''
      list_controller.new

      menu if TodoLists::List.count == 1
    else
      menu
    end
  end

  def menu
    list_controller.index
    until list_controller.last_input == '/exit'

      puts 'Enter list number or \'/help\' for more options or type /exit'

      list_controller.get_input

      last_input = list_controller.last_input.downcase

      if last_input.to_i > 0
        list_controller.show

      elsif last_input == '/new'
        list_controller.new

      elsif last_input.match?(/\/edit\s\d+/)
        list_controller.edit
        list_controller.index

      elsif last_input.match?(/\/delete\s\d+/)
        list_controller.delete
        list_controller.index

      elsif last_input == '/index'
        list_controller.index

      elsif last_input == '/help'
        list_controller.help
      end

    end
  end

end
