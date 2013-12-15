class Commission < Employee
  def commission
    commission = Sales.new.employee_sales
    if @last_name == 'Lob'
      commission['Lob'] * 0.005
    else
      commission['Bobby'] * 0.015
    end
  end

  def local_commission
    commission
  end

  def detailed_display
    puts "Commission: #{commission}"
  end
end
