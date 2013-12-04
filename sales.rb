require'csv'
require'pry'
require_relative('salary_based')

class Sales

  def initialize
    @monthly_sales = []
    read_in_sales
  end

  def read_in_sales
    CSV.foreach('sales_data.csv', headers: true) do |row|
      @monthly_sales << row.to_hash
    end
    @monthly_sales
  end

  def employee_sales
    @bobby = 0
    @wiggum = 0
    @groundskeeper = 0
    @lob = 0
    sales_total = {}

    @monthly_sales.each do |hash|
      @bobby += hash["gross_sale_value"].to_i if hash["last_name"] == "Bobby"
      @wiggum += hash["gross_sale_value"].to_i if hash["last_name"] == "Wiggum"
      @groundskeeper += hash["gross_sale_value"].to_i if hash["last_name"] == "Groundskeeper"
      @lob += hash["gross_sale_value"].to_i if hash["last_name"] == "Lob"
    end
    sales_total['Bobby'] = @bobby
    sales_total['Lob'] = @lob
    sales_total['Wiggum'] = @wiggum
    sales_total['Groundskeeper'] = @groundskeeper
    sales_total


  end

end
