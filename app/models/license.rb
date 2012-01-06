class RAMLicense < ActiveRecord::Base
  
  set_table_name "ram_licenses"
  unloadable

  has_and_belongs_to_many :pools, :class_name => "RAMPool", :join_table => "ram_pool_has_licenses", :foreign_key => :license_id, :association_foreign_key => :pool_id
  has_and_belongs_to_many :assets, :class_name => "RAMAsset", :join_table => "ram_asset_has_licenses", :foreign_key => :license_id, :association_foreign_key => :asset_id
  belongs_to :category, :class_name => "RAMLicenseCategory"
  belongs_to :type, :class_name => "RAMLicenseType"
  has_many :keys, :class_name => "RAMLicenseKey"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :name
  validates_presence_of :publisher
  validates_presence_of :serial

end
