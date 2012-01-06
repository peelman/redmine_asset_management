class RAMAssetStatus < ActiveRecord::Base
  
  set_table_name "ram_asset_statuses"
  unloadable
  
  has_many :assets, :class_name => "RAMAsset"

end
