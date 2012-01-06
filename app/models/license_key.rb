class RAMLicenseKey < ActiveRecord::Base
  
  set_table_name "ram_license_keys"
  unloadable
  
  belongs_to :license, :class_name => "RAMLicense"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"
  
  validates_presence_of :key

end
