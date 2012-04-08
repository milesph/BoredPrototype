class RemovePrimaryFromJoin < ActiveRecord::Migration
  def up
	remove_column :organizations_users, :id
  end

  def down
  end
end
