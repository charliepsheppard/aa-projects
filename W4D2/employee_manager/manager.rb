require_relative 'employee'

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary)
    super 
    @employees = []
    
  end
  def bonus(multiplier)
    total_wages = 0
    employees.each do |ee|
      total_wages += ee.salary
    end 

    total_wages * multiplier
    
  end 


end

Ned = Manager.new("ned", "Founder", 1000000)
Darren = Manager.new("darren", "TA Manager", 78000)
Darren.employees << Shawna << David 
Ned.employees << Darren << Shawna << David 

p Ned.bonus(5) # => 500_000
p Darren.bonus(4) # => 88_000
p David.bonus(3) # => 30_000