class LicenseKey < ActiveRecord::Base
  
  table_name_prefix "ram_"
  unloadable
  
  belongs_to :license, :class_name => "License"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"
  
  validates_presence_of :key

end
