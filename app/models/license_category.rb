class RAMLicenseCategory < ActiveRecord::Base
  
  set_table_name "ram_license_categories"
  unloadable
  
  has_many :licenses, :class_name => "RAMLicense", :foreign_key => :category

  validates_presence_of :name
end
