class AssetNote < ActiveRecord::Base
  
  set_table_name "ram_asset_notes"
  unloadable
  
  belongs_to :asset, :class_name => "Asset"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :body
end
