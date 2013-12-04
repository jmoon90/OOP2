require 'pry'

require_relative('employee')
require_relative('sales')
require_relative('commission')
require_relative('quota')
require_relative('owner')
require_relative('company')


company = Company.new
company.get_employees
company.display
