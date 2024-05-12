class Question
  attr_reader :ask_question, :correct_answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @operator = ['+', '-', '*', '/'].sample # Select a random operator from the array
    @ask_question = "What is #{@num1} #{@operator} #{@num2}?"
    @correct_answer = calculate_answer
  end

  private

  def calculate_answer
    case @operator
    when '+'
      @num1 + @num2
    when '-'
      @num1 - @num2
    when '*'
      @num1 * @num2
    when '/'
      @num1 / @num2
    end
  end