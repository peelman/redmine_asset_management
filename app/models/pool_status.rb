class PoolStatus < ActiveRecord::Base
  
  set_table_name "ram_pool_statues"
  unloadable
  
  has_many :pools, :class_name => "Pool"

end
