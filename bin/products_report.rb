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

  def productsreport_csv
    CSV.open("products_report#{Date.today}.csv", "wb", headers: true) do |productreport|  # Setup CSV file
      product_report << ["ID", "Name", "Price", "Category", "Category ID"] # Adds headers to csv file

      Product.all.each do |p|
        product_report << [p.id, p.name, p.price, p.category.name, p.category_id]  # Adds records from fields Product and Category table
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
    report_csv = "products_report#{Date.today}.csv"

    CSV.foreach(report_csv, headers: true) do |row| # Open and access the records of csv file
      product = Product.find_or_initialize_by(id: row["ID"])  # Considering that the product name is the primary key of the table, this will prevent duplicates and update exisiting records if found with the same product name
      category = Category.find_or_create_by!(id: row["Category ID"])

      product.price = row["Price"]
      product.category = category   # Stablish foreign key
      product.save! # Save the product
    end

    puts "Prodcuts have been imported from csv report"
  end

end

ProductReport.call if __FILE__ == $PROGRAM_NAME
