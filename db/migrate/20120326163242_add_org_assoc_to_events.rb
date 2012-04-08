class AddOrgAssocToEvents < ActiveRecord::Migration
  def change
	add_column :events, :organization_id, :integer
	add_column :events, :user_id, :integer
  end
end
