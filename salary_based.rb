require 'pry'
class SalaryBased < Employee
  def initialize(employee)
     binding.pry
    super

  end

  def calculate_tax
    (@employee['base_pay'].to_i * @tax / 12)
  end

  def gross_pay
    (@employee['base_pay'].to_i / 12)

  end

  def net_pay
    gross_pay - calculate_tax
  end

  def display
    puts "***#{@employee['first_name']} #{@employee['last_name']}***"
    puts "Gross Salary: #{gross_pay}"
    puts "Net Pay: #{net_pay}\n\n"
  end
end


