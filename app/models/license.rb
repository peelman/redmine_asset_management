class License < ActiveRecord::Base
  
  set_table_name "ram_licenses"
  unloadable

  has_and_belongs_to_many :pools, :class_name => "Pool", :join_table => "ram_pool_has_licenses", :foreign_key => :license_id, :association_foreign_key => :pool_id
  has_and_belongs_to_many :assets, :class_name => "Asset", :join_table => "ram_asset_has_licenses", :foreign_key => :license_id, :association_foreign_key => :asset_id
  belongs_to :category, :class_name => "LicenseCategory"
  belongs_to :type, :class_name => "LicenseType"
  belongs_to :owned_by, :class_name => "User"
  belongs_to :created_by, :class_name => "User"
  belongs_to :updated_by, :class_name => "User"
  has_many :keys, :class_name => "LicenseKey"
  has_many :notes, :class_name => "LicenseNote", :foreign_key => :license_id

  validates_presence_of :name
  validates_presence_of :publisher_name
  validates_presence_of :version

end
