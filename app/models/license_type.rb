class RAMLicenseType < ActiveRecord::Base
  
  set_table_name "ram_license_types"
  
  unloadable
  has_many :licenses, :class_name => "RAMLicense"
  
  validates_presence_of :name

end
