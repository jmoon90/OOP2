class SalaryBased
  def initialize(employee)
    @employee = employee
    @tax = 0.3
    calculate_tax
    gross_pay
    net_pay
    display
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


