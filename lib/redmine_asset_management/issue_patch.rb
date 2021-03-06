module RedmineAssetManagement
  # Patches Redmine's Issues dynamically. Adds a relationship
  # Issue +has_many+ to Asset
  module IssuePatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do 
        unloadable # Send unloadable so it will not be unloaded in development
        has_and_belongs_to_many :assets, 
                                :join_table => "ram_issue_has_assets", 
                                :class_name => "Asset", 
                                :foreign_key => "issue_id", 
                                :association_foreign_key => "asset_id"
      end
    end
  end
end