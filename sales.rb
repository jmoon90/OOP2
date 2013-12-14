require'csv'

class Sales
  attr_reader :monthly_sales

  def initialize
    @monthly_sales = []
    read_in_sales
    @bobby = 0
    @wiggum = 0
    @groundskeeper = 0
    @lob = 0
  end

  def read_in_sales
    CSV.foreach('sales_data.csv', headers: true) do |row|
      @monthly_sales << row.to_hash
    end
    @monthly_sales
  end

  def employee_sales
    sales_total = {}
    @monthly_sales.each do |hash|
      sale_employee(hash)
    end
    total_sale(sales_total)
  end

  def sale_employee(hash)
    gsv = 'gross_sale_value'
    @bobby += hash[gsv].to_i if hash['last_name'] == 'Bobby'
    @wiggum += hash[gsv].to_i if hash['last_name'] == 'Wiggum'
    @groundskeeper += hash[gsv].to_i if hash['last_name'] == 'Groundskeeper'
    @lob += hash[gsv].to_i if hash['last_name'] == 'Lob'
  end

  def total_sale(sales_total)
    sales_total['Bobby'] = @bobby
    sales_total['Lob'] = @lob
    sales_total['Groundskeeper'] = @groundskeeper
    sales_total['Wiggum'] = @wiggum
    sales_total
  end
end
