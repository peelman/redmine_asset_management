class AssetStatus < ActiveRecord::Base
  
  table_name_prefix "ram_"
  unloadable
  
  has_many :assets, :class_name => "Asset"

end
