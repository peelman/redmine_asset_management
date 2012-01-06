class RAMPool < ActiveRecord::Base
  acts_as_tree
  set_table_name "ram_pools"
  unloadable
  
  has_and_belongs_to_many :assets, :class_name => "RAMAsset", :join_table => "ram_pool_has_assets", :foreign_key => :pool_id, :association_foreign_key => :asset_id
  has_and_belongs_to_many :licenses, :class_name => "RAMLicense", :join_table => "ram_pool_has_licenses", :foreign_key => :pool_id, :association_foreign_key => :license_id
  has_many :notes, :class_name => "RAMPoolNote", :foreign_key => :pool_id
  has_many :children, :class_name => "RAMPool", :foreign_key => :parent_id
  has_one :parent_id, :class_name => "RAMPool"
  has_one :status, :class_name => "RAMAssetStatus"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :name

end
