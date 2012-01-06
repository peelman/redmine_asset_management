class AssetNote < ActiveRecord::Base
  
  table_name_prefix "ram_"
  unloadable
  
  belongs_to :assets, :class_name => "Asset"
  has_one :created_by, :class_name => "User"
  has_one :updated_by, :class_name => "User"

  validates_presence_of :body
end
