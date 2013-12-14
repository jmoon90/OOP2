require 'csv'

class Company
  attr_reader :employees

  def initialize
    @employees = []
  end

  def get_employees
    CSV.foreach('employee_list.csv', headers: true) do |row|
      pay_structure = row['pay_structure']
      employee = nil
      if pay_structure == 'commission'
        employee = Commission.new(row)
      elsif pay_structure == 'quota'
        employee = Quota.new(row)
      elsif pay_structure == 'owner'
        employee = Owner.new(row)
      else
        employee = Employee.new(row)
      end
      @employees << employee
    end
  end

  def display
    @employees.each do |employee|
      puts employee.display
    end
  end
end



