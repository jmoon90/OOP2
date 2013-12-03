require'csv'
require'pry'
require_relative('salary_based')


class Employee

  def initialize(employee)
    @employee = employee
    categorize_employees
  end

  def categorize_employees
binding.pry
      SalaryBased.new(@employee) if @employee['pay_structure'] == "salary"
      @commission_employees << employee if @employee['pay_structure'] == "commission"
      @quota_employees << employee if @employee['pay_structure'] == "quota"
  end

end
