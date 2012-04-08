class RenameJoinTables < ActiveRecord::Migration
  def self.up
    rename_table :events_organizations, :event_organizations
	rename_table :organizations_users, :organization_users
  end

 def self.down
    rename_table :event_organizations, :events_organizations
	rename_table :organization_users, :organizations_users
 end
end
