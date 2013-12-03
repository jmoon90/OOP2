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
  end

  def get_employee_list
    CSV.foreach(@filename, headers: true) do |row|
      @employee_list << row.to_hash
    end

    @employee_list
  end

end

employee = Employee.new('employee_list.csv')
employee.get_employee_list

#Owner class
#   monthly quota must hit 250,000 for owner to get 1000 bonus
#

#SalaryBased Class
#   Non-commission/quota employees


#CommissionSalesPerson class
#   comission is .5% or 1.5% of sales


#QuotaSalesPerson Class
# Quota amount is either 5000 or 10,000



#SaleClass
#   Should have a class method that returns a list of sales loaded from the CSV
#   Need to read in a csv file with the the sales data

#Need to output to a textfile with the salary information
#......(Gross pay + any bonus/comission)

