class Quota < Employee
  def gross_pay
    super + commission / 12
  end

  def commission
    commission = Sales.new.employee_sales
    if @last_name == 'Wiggum'
      commission['Wiggum'] > 80_000 ? @value = 10_000 : @value = 0
    else
      @value = 5000 if commission['Groundskeeper'] > 60_000
    end
    @value
  end

  def display
    puts "***#{@first_name} #{@last_name}***"
    puts "Gross Salary: #{gross_pay}"
    puts "Commission: #{commission}"
    puts "Net Pay: #{net_pay.round(2)}\n"
  end
end


