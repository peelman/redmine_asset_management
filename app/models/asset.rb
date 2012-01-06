class RAMAsset < ActiveRecord::Base
  
  set_table_name "ram_assets"
  
  unloadable
  has_and_belongs_to_many :issues, :join_table => "ram_issue_has_assets"
  has_and_belongs_to_many :licenses, :class_name => "RAMLicense", :join_table => "ram_asset_has_licenses"
  has_and_belongs_to_many :categories, :class_name => "RAMAssetCategory", :join_table => "ram_asset_has_categories"
  has_many :children, :class_name => "RAMAsset", :foreign_key => :parent_id
  has_one :parent_id, :class_name => "RAMAsset"
  has_one :location, :class_name => "RAMLocation"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"


  cattr_reader :per_page
  @@per_page = 25
  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :serial

end
