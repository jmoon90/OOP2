class Quota
  def initialize(commission_employees)
    @tax = 0.3
    @commission_employees = commission_employees
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
    @gross_pay = (@commission_employees['base_pay'].to_i / 12) + @value
  end

  def commission
    commission = Sales.new.employee_sales
    if @commission_employees['last_name'] == "Wiggum"
      commission['Wiggum'] > 80000 ? @value = 10000 : @value = 0
    else
      @value = 5000 if commission['Groundskeeper'] > 60000
    end
    @value
  end

  def net_pay
    @gross_pay - calculate_tax
  end

  def display
    puts "***#{@commission_employees['first_name']} #{@commission_employees['last_name']}***"
    puts "Gross Salary: #{gross_pay}"
    puts "Commission: #{commission}"
    puts "Net Pay: #{net_pay.round(2)}\n\n"
  end
end


