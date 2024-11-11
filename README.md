# E-Commerce
This application was created and developed on a Windows computer. If you are running this application from a Windows computer, for a better experience, please use the Windows Subsystem for Linux (WSL), which allows you to run Linux distributions natively without the need for a Virtual Machine (VM). This application was developed on a Linux server. 

## Application Description
A fully functional e-commerce website with features like product listing, users authentication, shopping cart, and real time purchase through Stripe.

This app uses:
* ActiveRecord
* Active Storage including: Action Text and Rich Text
* Devises

## How to run this project?
* If you are using a Windows computer, please open Ubuntu and run the following command to initialize the PostgreSQL database: `sudo service postgresql start`
* Run the server: `bin/dev`
* To run the seeds: `rails db:seed`

* In case you want to generate a report of the current products, please run the scripts located in: bin/products_csv.rb and products_report.rb: `ruby products_csv.rb and/or ruby products_report.rb` 

## Technologies used to develop this project:
<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=rails,js,postgresql,tailwind" />
  </a>
</p>

##### Make sure you install and run the latest features: 

* Ruby version: 3.3.5

* System dependencies

* Configuration