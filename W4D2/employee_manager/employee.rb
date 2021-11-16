class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name 
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
      salary * multiplier
  end 

end

Shawna = Employee.new("shawna", "TA", 12000, "Darren")
David = Employee.new("david", "TA", 10000, "Darren")
