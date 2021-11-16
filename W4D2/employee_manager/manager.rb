require_relative 'employee'

class Manager < Employee
  def initialize
    @employees = []
  end
end