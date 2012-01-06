class PoolStatus < ActiveRecord::Base
  
  set_table_name "ram_pool_statuses"
  unloadable
  
  has_many :pools, :class_name => "Pool"

end
