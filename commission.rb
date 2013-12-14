class Commission < Employee
  def gross_pay
    super + commission
  end

  def commission
    commission = Sales.new.employee_sales
    if @last_name == 'Lob'
      commission['Lob'] * 0.005
    else
      commission['Bobby'] * 0.015
    end
  end

  def display
    puts "***#{@first_name} #{@last_name}***"
    puts "Gross Salary: #{gross_pay}"
    puts "Commission: #{commission}"
    puts "Net Pay: #{net_pay.round(2)}\n"
  end
end
