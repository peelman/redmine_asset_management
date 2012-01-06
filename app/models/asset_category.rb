class AssetCategory < ActiveRecord::Base
  
  set_table_name "ram_asset_categories"
  unloadable

  has_many :assets, :class_name => "Asset", :foreign_key => :category

  validates_presence_of :name
end
