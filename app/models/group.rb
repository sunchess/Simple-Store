class Group < ActiveRecord::Base
  
  acts_as_list  :scope => :parent_id
  acts_as_tree  :order => "position"

  attr_accessible :name

  has_many :products
  validates_presence_of :name
  validates_length_of :name, :within => 4..45

  before_destroy :checking

  def checking
    if products.any? 
     errors.add(:name, t("group.errors.has_products" ))  
    end
  end
end
