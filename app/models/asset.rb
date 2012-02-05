class Asset < ActiveRecord::Base
  acts_as_tree
  set_table_name "ram_assets"
  unloadable
  
  has_and_belongs_to_many :pools, :class_name => "Pool", :join_table => "ram_pool_has_assets", :foreign_key => :asset_id, :association_foreign_key => :pool_id
  has_and_belongs_to_many :issues, :join_table => "ram_issue_has_assets", :foreign_key => :asset_id, :association_foreign_key => :issue_id
  has_and_belongs_to_many :licenses, :class_name => "License", :join_table => "ram_asset_has_licenses", :foreign_key => :asset_id, :association_foreign_key => :license_id
  belongs_to :category, :class_name => "AssetCategory"
  belongs_to :status, :class_name => "AssetStatus"
  belongs_to :owned_by, :class_name => "User"
  belongs_to :created_by, :class_name => "User"
  belongs_to :updated_by, :class_name => "User"
  belongs_to :parent, :class_name => "Asset"
  has_many :children, :class_name => "Asset", :foreign_key => :parent_id
  has_many :notes, :class_name => "AssetNote", :foreign_key => :asset_id


  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :serial

end
