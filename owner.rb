class Owner < Employee
  def local_commission
    commission
  end

  def commission
    commission = Sales.new.employee_sales
    monthly_sales = commission.values.inject(:+)
    @bonus = monthly_sales > 250000 ? 1000 : 0
    @bonus
  end

  def detailed_display
    puts "Commission: #{commission}"
  end
end
