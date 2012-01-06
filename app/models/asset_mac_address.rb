class AssetMACAddress < ActiveRecord::Base
  
  table_name_prefix "ram_"
  unloadable
  
  belongs_to :assets, :class_name => "Asset"

  validates_presence_of :mac
  validates_presence_of :type
end
