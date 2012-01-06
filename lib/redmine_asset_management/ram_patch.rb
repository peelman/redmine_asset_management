module RedmineAssetManagement
  
  # Patches Redmine's Issues dynamically. Adds a relationship
  # Issue +has_many+ to IssueDepartment
  module IssuePatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
        has_and_belongs_to_many :issues, :class_name => "RAMAsset", :join_table => "ram_issue_has_assets", :foreign_key => :issue_id, :associate_foreign_key => :asset_id
        
      end
   
    end
  end
  
  module ApplicationControllerPatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
        helper RAMHelper
      end
    end
  end
end
