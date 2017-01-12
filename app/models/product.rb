class Product < ActiveRecord::Base

  UNRANSACKABLE_ATTRIBUTES = ["id","manufacturer_id", "category_id", "updated_at", "created_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  belongs_to :manufacturer
  belongs_to :category
end
