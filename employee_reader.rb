#Need an Employee class
#    tax rate is 30%
#    need a csv to read-in a list of employees
#    base salary
#    pay structure < commission or quota specific
require'csv'
require'pry'

class Employee

  def initialize(filename)
    @filename = filename
    @employee_list = []
    @salary_employees = []
    @commission_employees = []
    @quota_employees =[]

  end

  def self.get_employee_list
    CSV.foreach('employee_list.csv', headers: true) do |row|
      @employee_list << row.to_hash
    end
      @employee_list
  end

  def categorize_employees
    @employee_list.each do |employee|
      @salary_employees << employee if employee['pay_structure'] == "salary"
      @commission_employees << employee if employee['pay_structure'] == "commission"
      @quota_employees << employee if employee['pay_structure'] == "quota"
    end
    puts @salary_employees
    puts @commission_employees
    puts @quota_employees
      #if employee
  end

  def make_salary_based
    binding.pry
    SalaryBased.new(@salary_employees)
  end



end



#Owner class
#   monthly quota must hit 250,000 for owner to get 1000 bonus
#
class Owner < Employee

  def initialize(monthly_quota)
    @monthly_quota = monthly_quota
  end


  def bonus_earned?
    true if @monthly_quota > 250000
  end
end

#Pay Class

# def initialize (base, commission, quota) <- pulls from diff classes
#  takes in all pay types earned per employee
#  will determine gross salary (base + commissh + quota)
#  will determine net salary (gross salary - tax)

#class PaySummary

  def initialize(arguments)
    @base = arguments[:base] ||= 0
    @commission = arguments[:commission] ||= 0
    @quota = arguments[:quota] ||= 0
    @tax = 0.3
  end

  def gross_pay
    @base + @commission + @quota
  end

  def net_pay
    gross_pay - (gross_pay * @tax)
  end
end


#SalaryBased Class
#   Non-commission/quota employees
class SalaryBased

  def initialize(salary_employees)
    @salary_employees = salary_employees
    binding.pry
  end

  def

end
#CommissionSalesPerson class
#   comission is .5% or 1.5% of sales
#   will determine any commission



class CommissionSalesPerson
  def initialize(commission_employees)
    @commission_employees = commission_employees
  end

end


#QuotaSalesPerson Class
# Quota amount is either 5000 or 10,000
#  will determine any quota

class QuotaSalesPerson

end



#SaleClass
class Sale < Employee
  def initialize(file_name)
    @file_name = file_name
    @monthly_sales = []
    read_in_sales
  end

  def read_in_sales
    CSV.foreach(@file_name, headers: true) do |row|
      @monthly_sales << row.to_hash
    end
    @monthly_sales
  end

  def employee_sales
    @bobby = 0
    @wiggum = 0
    @groundskeeper = 0
    @lob = 0

    @monthly_sales.each do |hash|
      @bobby += hash["gross_sale_value"].to_i if hash["last_name"] == "Bobby"
      @wiggum += hash["gross_sale_value"].to_i if hash["last_name"] == "Wiggum"
      @groundskeeper += hash["gross_sale_value"].to_i if hash["last_name"] == "Groundskeeper"
      @lob += hash["gross_sale_value"].to_i if hash["last_name"] == "Lob"
    end
    puts @bobby
    puts @wiggum
    puts @groundskeeper
    puts @lob
  end

end

employee = Employee.new('employee_list.csv')
employee.get_employee_list
employee.categorize_employees
employee.make_salary_based

sale = Sale.new("sales_data.csv")
sale.employee_sales
#   Should have a class method that returns a list of sales loaded from the CSV
#   Need to read in a csv file with the the sales data

#Need to output to a textfile with the salary information
#......(Gross pay + any bonus/comission)

