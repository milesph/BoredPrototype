class RemoveEventOrganization < ActiveRecord::Migration
  def up
	drop_table :event_organizations
  end

  def down
  end
end
