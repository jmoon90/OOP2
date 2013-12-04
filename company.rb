require'csv'
require_relative('employee')

class Company
  def self.get_employee_list
    CSV.foreach('employee_list.csv', headers: true) do |row|
     Employee.new(row.to_hash)
    end
  end
end

Company.get_employee_list
