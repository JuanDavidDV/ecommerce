require "csv"
require_relative "../config/environment"

class ProductReport
  def self.call
    new.call
  end

  def call
    products_report_csv   # Generates csv report

    delete_products_records   # Deletes all records from Product table

    import_products_csv   #Imports products from csv generated
  end


  private

  def products_report_csv
    CSV.open("products_report_#{Date.today}.csv", "wb", headers: true) do |product_report|  # Setup CSV file
      product_report << ["Name", "Price", "Category"] # Adds headers to csv file

      Product.all.each do |p|
        product_report << [p.name, p.price, p.category.name]  # Adds records from fields Product and Category table
      end
    end 
    puts "Products report has been successfully created"
  end

  def delete_products_records
    Product.find_each do |product|
      product.destroy!
    end
    puts "Product records have been deleted"
  end

  def import_products_csv
    report_csv = "products_report_#{Date.today}.csv"

    CSV.foreach(report_csv, headers: true) do |row| # Open and access the records of csv file
      product = Product.find_or_create_by(name: row["Name"])  # Considering that the product name is the primary key of the table, this will prevent duplicates and update exisiting records if found with the same product name
      
      product.price = row["Price"]
      
      category_name = row["Category"]
      category = Category.find_or_create_by(name: category_name)
      product.category = category   # Stablish foreign key

      product.save # Save the product
    end
    puts "Prodcuts have been imported from csv report"
  end

end

ProductReport.call if __FILE__ == $PROGRAM_NAME
