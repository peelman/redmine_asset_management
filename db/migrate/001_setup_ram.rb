class SetupRAM < ActiveRecord::Migration
  class RAMAssetStatus < ActiveRecord::Base; end
  
  def self.up
    create_table :ram_pools, :force => true do |t|
      t.string :name
      t.integer :parent_id, :owned_by, :created_by, :updated_by, :status
      t.timestamps
    end

    create_table :ram_pool_notes, :force => true do |t|
      t.string :summary, :limit => 200
      t.string :body, :limit => 2500
      t.integer :pool_id, :created_by, :updated_by
      t.timestamps
    end
    
    create_table :ram_assets, :force => true do |t|
      t.string :make, :limit => 100, :null => false
      t.string :model, :serial, :description, :limit => 100, :null => false, :default => nil
      t.string :expected_life, :limit => 50
      t.integer :parent_id, :owned_by, :created_by, :updated_by, :category, :default_location, :status
      t.datetime :purchase_date
      t.string :purchase_price, :limit => 15
      t.string :purchase_order_number, :limit => 50
      t.string :purchase_notes, :limit => 1000
      t.datetime :warranty_expiration, :null => true
      t.boolean :retired, :default => false
      t.datetime :retired_date, :null => true
      t.timestamps
    end
    
    create_table :ram_asset_categories, :force => true do |t|
      t.string :name, :description
      t.timestamps
    end

    create_table :ram_asset_notes, :force => true do |t|
      t.string :summary, :limit => 200
      t.string :body, :limit => 2500
      t.integer :asset_id, :created_by, :updated_by
      t.timestamps
    end
    
    create_table :ram_asset_mac_addresses, :force => true do |t|
      t.string :mac, :limit => 21, :null => false
      t.string :type, :limit => 25, :null => false
      t.timestamps
    end
    
    create_table :ram_asset_statuses, :force => true do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :ram_licenses, :force => true do |t|
      t.string :name, :limit => 100, :null => false
      t.string :version, :limit => 15
      t.integer :type, :category, :owned_by, :created_by, :updated_by
      t.integer :count
      t.string :license_notes, :limit => 1000
      t.datetime :purchase_date
      t.datetime :expiration_date
      t.datetime :renewal_date
      t.datetime :download_date
      t.string :publisher_name
      t.string :publisher_url
      t.string :publisher_contact_name
      t.string :publisher_contact_phone
      t.string :publisher_contact_email
      t.string :registration_notes, :limit => 1000
      t.timestamps
    end
    
    create_table :ram_license_keys, :force => true do |t|
      t.string :key, :limit => 500
      t.integer :license_id
      t.integer :owned_by
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end

    create_table :ram_license_types, :force => true do |t|
      t.string :name, :limit => 100
      t.string :description, :limit => 500
      t.timestamps
    end
    
    create_table :ram_license_categories, :force => true do |t|
      t.string :name, :description
      t.timestamps
    end

    create_table :ram_issue_has_assets, :id => false do |t|
      t.integer :asset_id, :issue_id
    end
    
    create_table :ram_asset_has_licenses, :id => false do |t|
      t.integer :asset_id, :issue_id
    end

    create_table :ram_pool_has_assets, :id => false do |t|
      t.integer :pool_id, :asset_id
    end
    
    create_table :ram_pool_has_licenses, :id => false do |t|
      t.integer :pool_id, :license_id
    end
    
    AssetStatus.create :name => "Active"
    AssetStatus.create :name => "Inactive"
    AssetStatus.create :name => "Missing"
    AssetStatus.create :name => "Loaned"
    AssetStatus.create :name => "Destroyed"
    AssetStatus.create :name => "Sold"
    AssetStatus.create :name => "Stolen"

  end

  def self.down
    drop_table :ram_assets
    drop_table :ram_asset_categories
    drop_table :ram_asset_notes
    drop_table :ram_asset_mac_addresses
    drop_table :ram_asset_statuses
    drop_table :ram_licenses
    drop_table :ram_license_keys
    drop_table :ram_license_types
    drop_table :ram_license_categories
    drop_table :ram_locations
    drop_table :ram_issue_has_assets
    drop_table :ram_asset_has_licenses
  end
end
