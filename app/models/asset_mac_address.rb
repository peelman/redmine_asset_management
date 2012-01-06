class RAMAssetMACAddress < ActiveRecord::Base
  
  set_table_name "ram_asset_mac_addresses"
  
  unloadable
  belongs_to :assets, :class_name => "RAMAsset"

  validates_presence_of :mac
  validates_presence_of :type
end
