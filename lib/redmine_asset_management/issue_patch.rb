module RedmineAssetManagement
  
  # Patches Redmine's Issues dynamically. Adds a relationship
  # Issue +has_many+ to Asset
  module IssuePatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do 
    end
  end
  
  # Patches Redmine's ApplicationController to include a RAM Helper
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
