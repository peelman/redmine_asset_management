module RedmineAssetManagement
  # Patches Redmine's Issues dynamically. Adds a relationship
  # Issue +has_many+ to Asset
  module UserPatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do 
        unloadable # Send unloadable so it will not be unloaded in development
        has_many :owned_assets, :class_name => "Asset"
        has_many :created_assets, :class_name => "Asset"
        has_many :updated_assets, :class_name => "Asset"
      end
    end
  end
end