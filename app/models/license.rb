class RAMLicense < ActiveRecord::Base
  
  set_table_name "ram_licenses"
  unloadable

  has_and_belongs_to_many :assets, :class_name => "RAMAsset", :join_table => "ram_asset_has_licenses"
  has_and_belongs_to_many :categories, :class_name => "RAMLicenseCategory", :join_table => "ram_license_has_categories"
  belongs_to :type, :class_name => "RAMLicenseType"
  has_many :keys, :class_name => "RAMLicenseKey"
  has_one :owned_by, :class_name => "User"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :name
  validates_presence_of :publisher
  validates_presence_of :serial

end
