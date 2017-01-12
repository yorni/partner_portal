class Category < ActiveRecord::Base
  has_many :products
  UNRANSACKABLE_ATTRIBUTES = [ "updated_at", "created_at", "code"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
