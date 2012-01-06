class RAMLocation < ActiveRecord::Base
  
  set_table_name "ram_locations"
  unloadable
  
  has_many :assets, :class_name => "RAMAsset"

end
