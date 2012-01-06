class LicenseType < ActiveRecord::Base
  
  set_table_name "ram_license_types"
  unloadable
  
  has_many :licenses, :class_name => "License"
  
  validates_presence_of :name

end
