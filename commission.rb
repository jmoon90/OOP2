require'pry'
require_relative 'sales'

class Commission < Sales

  def initialize(commission_employees)
    @tax = 0.3
    @commission_employees = commission_employees
    commission
    gross_pay
    calculate_tax
    net_pay
  end

  def calculate_tax
    gross_pay * @tax
  end

  def gross_pay
    (@commission_employees['base_pay'].to_i / 12) + commission
  end

  def commission
    commission = Sales.new.employee_sales
    if @commission_employees['last_name'] == "Lob"
      commission['Lob'] * 0.005
    else
      commission['Bobby'] * 0.015
    end

  end

  def net_pay
    gross_pay - calculate_tax
  end

end
