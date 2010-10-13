class Product < ActiveRecord::Base
  belongs_to :group, :counter_cache=>true

  validates_presence_of :name, :price
  validates_numericality_of :price



end
