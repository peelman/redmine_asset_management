class Asset < ActiveRecord::Base
  acts_as_tree
  table_name_prefix "ram_"
  unloadable
  
  has_and_belongs_to_many :pools, :class_name => "Pool", :join_table => "ram_pool_has_assets", :foreign_key => :asset_id, :association_foreign_key => :pool_id
  has_and_belongs_to_many :issues, :join_table => "ram_issue_has_assets", :foreign_key => :asset_id, :association_foreign_key => :issue_id
  has_and_belongs_to_many :licenses, :class_name => "License", :join_table => "ram_asset_has_licenses", :foreign_key => :asset_id, :association_foreign_key => :license_id
  belongs_to :category, :class_name => "AssetCategory"
  has_many :notes, :class_name => "AssetNote", :foreign_key => :asset_id
  has_many :children, :class_name => "Asset", :foreign_key => :parent_id
  has_one :parent_id, :class_name => "Asset"
  has_one :status, :class_name => "AssetStatus"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :serial

end
