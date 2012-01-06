class RAMLicenseCategory < ActiveRecord::Base
  
  set_table_name "ram_license_categories"
  unloadable
  
  has_and_belongs_to_many :licenses, :class_name => "RAMLicense", :join_table => "ram_license_has_categories"

  validates_presence_of :name
end
