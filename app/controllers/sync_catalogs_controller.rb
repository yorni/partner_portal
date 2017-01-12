class SyncCatalogsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}
      
def manufacturer_update
  manufacturer = Manufacturer.find_by code: params["code"]
    unless manufacturer
      manufacturer = Manufacturer.new
    end
  manufacturer.name = params["name"]
  manufacturer.save
  render json: { result: true }
end
    
    
 def category_update
   category = Category.find_by code: params["code"]
   unless category
     category = Category.new
   end
   category.name = params["name"]
   category.save
   render json: { result: true }
  end
    
        
def product_update
  product = Product.find_by code: params["code"]
  manufacturer = Manufacturer.find_by code: params["manufacturer_code"]
  category = Category.find_by code: params["category_code"]
      unless product
          product = Product.new
      end
  product.name = params["name"]
  product.description = params["description"]
  product.price = params["price"]
  product.stock = params["stock"]
  product.manufacturer_id = manufacturer.id
  product.category_id = category.id
  product.part_number = params["part_number"]
  product.save
  render json: { result: true }
end

    
end



