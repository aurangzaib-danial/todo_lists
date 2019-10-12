class TodoLists::CLI

  attr_reader :lists_controller, :items_controller
  def initialize
    @lists_controller = TodoLists::ListsController.new
    @items_controller = TodoLists::ItemsController.new
  end


  def call
    if TodoLists::List.count == 0
      lists_controller.new
      @list = TodoLists::List.last
      items_menu if @list
    else
      lists_menu  # only list menu if a list was created
    end
  end

  def lists_menu
    lists_controller.index
    until lists_controller.last_input == '/exit'

      puts "\nEnter list number or \'/help\' for more options or type /exit"

      lists_controller.get_input

      last_input = lists_controller.last_input.downcase

      if last_input.to_i > 0
        @list = TodoLists::List.find_by_index(last_input)
        items_menu if @list

      elsif last_input == '/new'
        last_before_new = TodoLists::List.last

        lists_controller.new

        last_after_new = TodoLists::List.last

        if last_before_new != last_after_new # find out if a list was created in new action or not
          @list = last_after_new
          items_menu
        end

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
    items_controller.list = @list

    until items_controller.last_input == '/exit' || items_controller.last_input == '/main'
      if @help_shown
        @help_shown = false
      else
        items_controller.index
      end

      puts "\nEnter new item or \'/help\' for more options or type /main"

      items_controller.get_input
      last_input = items_controller.last_input.downcase

      if last_input.match?(/\/done\s\d+/)
        items_controller.done

      elsif last_input.match?(/\/edit\s\d+/)
        items_controller.edit

      elsif last_input.match?(/\/delete\s\d+/)
        items_controller.delete

      elsif last_input == '/index'
        items_controller.index

      elsif last_input == '/help'
        items_controller.help
        @help_shown = true

      elsif last_input != '/exit' and last_input != '/main'
        items_controller.new
      end

    end

    case items_controller.last_input.downcase
    when '/main'
      lists_controller.index
    when '/exit'
      lists_controller.last_input = '/exit' # exit from lists_menu as well
    end

    items_controller.last_input = nil # reset last_input
  end

end
