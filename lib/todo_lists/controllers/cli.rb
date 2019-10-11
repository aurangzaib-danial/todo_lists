class TodoLists::CLI

  attr_reader :last_input

  def call
    puts 'Hello World!'
  end

  def instructions

  end

  def user_input
    @last_input = gets.strip
  end
end
