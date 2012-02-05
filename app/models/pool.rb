class Pool < ActiveRecord::Base
  acts_as_tree
  set_table_name "ram_pools"
  unloadable
  
  has_and_belongs_to_many :assets, :class_name => "Asset", :join_table => "ram_pool_has_assets", :foreign_key => :pool_id, :association_foreign_key => :asset_id
  has_and_belongs_to_many :licenses, :class_name => "License", :join_table => "ram_pool_has_licenses", :foreign_key => :pool_id, :association_foreign_key => :license_id
  belongs_to :parent, :class_name => "Pool"
  belongs_to :status, :class_name => "PoolStatus"
  belongs_to :owned_by, :class_name => "User"
  belongs_to :created_by, :class_name => "User"
  belongs_to :updated_by, :class_name => "User"
  has_many :notes, :class_name => "PoolNote", :foreign_key => :pool_id
  has_many :children, :class_name => "Pool", :foreign_key => :parent_id

  validates_presence_of :name

end
