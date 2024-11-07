require "csv"
require_relative "../config/environment"

class GenerateProductsCsv
  def self.call
    new.call
  end


  def call
    CSV.open("products-#{Date.today}.csv", "wb", headers: true) do |products_csv|
      products_csv << ["Name", "Price", "Category"] #Adds the headers

      Product.all.each do |p|
        products_csv << [p.name, p.price, p.category.name]  # Adds fields from tables to csv
      end
    end

    puts "products csv file successfully created"
  end
end

# Checks if current file is the same as the file executed.
GenerateProductsCsv.call if __FILE__ == $PROGRAM_NAME
