class RenameOrganizations < ActiveRecord::Migration
  def up
    rename_table:organizations_users, :organization_users
  end

  def down
    rename_table :organizations_users, :organizations_users
  end
end
