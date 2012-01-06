module RedmineAssetManagement
  
  # Patches Redmine's Issues dynamically. Adds a relationship
  # Issue +has_many+ to Asset
  module IssuePatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do 
    end
  end

end
