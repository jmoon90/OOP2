class Quota < Employee

  def local_commission
    commission
  end

  def commission
    commission = Sales.new.employee_sales
    if last_name == 'Wiggum'
      commission['Wiggum'] > 80_000 ? @value = 10_000 : @value = 0
    else
      @value = 5000 if commission['Groundskeeper'] > 60_000
    end
    @value
  end

  def detailed_display
    puts "Commission: #{commission}"
  end
end


