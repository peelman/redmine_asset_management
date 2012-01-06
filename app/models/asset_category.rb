class RAMAssetCategory < ActiveRecord::Base
  
  set_table_name "ram_asset_categories"
  unloadable

  has_and_belongs_to_many :assets, :class_name => "RAMAsset", :join_table => "ram_asset_has_categories"

  validates_presence_of :name
end
