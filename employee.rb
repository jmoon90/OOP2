require'csv'
require'pry'
require_relative('salary_based')
require_relative('commission')
require_relative('quota')



class Employee

  def initialize(employee)
    @employee = employee
    categorize_employees
  end

  def categorize_employees
      SalaryBased.new(@employee) if @employee['pay_structure'] == "salary"
      Commission.new(@employee) if @employee['pay_structure'] == "commission"
      Quota.new(@employee) if @employee['pay_structure'] == "quota"
  end

end
