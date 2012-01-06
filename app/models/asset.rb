class RAMAsset < ActiveRecord::Base
  acts_as_tree
  set_table_name "ram_assets"
  unloadable
  
  has_and_belongs_to_many :pools, :class_name => "RAMPool", :join_table => "ram_pool_has_assets", :foreign_key => :asset_id, :associate_foreign_key => :pool_id
  has_and_belongs_to_many :issues, :join_table => "ram_issue_has_assets", :foreign_key => :asset_id, :associate_foreign_key => :issue_id
  has_and_belongs_to_many :licenses, :class_name => "RAMLicense", :join_table => "ram_asset_has_licenses", :foreign_key => :asset_id, :associate_foreign_key => :license_id
  belongs_to :category, :class_name => "RAMAssetCategory"
  has_many :asset_notes, :class_name => "RAMAssetNote", :foreign_key => :asset_id
  has_many :children, :class_name => "RAMAsset", :foreign_key => :parent_id
  has_one :parent_id, :class_name => "RAMAsset"
  has_one :status, :class_name => "RAMAssetStatus"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :serial

end
