class LicenseType < ActiveRecord::Base
  
  table_name_prefix "ram_"
  unloadable
  
  has_many :licenses, :class_name => "License"
  
  validates_presence_of :name

end
