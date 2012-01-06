class PoolNote < ActiveRecord::Base
  
  set_table_name "ram_pool_notes"
  unloadable
  
  belongs_to :pool, :class_name => "Pool"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :body
end
