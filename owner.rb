class Owner
  def initialize(owner_employee)
    @tax = 0.3
    @owner_employee = owner_employee
    commission
    gross_pay
    calculate_tax
    net_pay
    display
  end

  def calculate_tax
    @gross_pay * @tax
  end

  def gross_pay
    @gross_pay = (@owner_employee['base_pay'].to_i / 12) + @bonus
  end

  def commission
    commission = Sales.new.employee_sales
    monthly_sales = commission.values.inject(:+)
    @bonus = monthly_sales > 250000 ? 1000 : 0
  end

  def net_pay
    @gross_pay - calculate_tax
  end

  def display
    puts "***#{@owner_employee['first_name']} #{@owner_employee['last_name']}***"
    puts "Gross Salary: #{gross_pay}"
    puts "Commission: #{commission}"
    puts "Net Pay: #{net_pay.round(2)}\n\n"
  end
end
