class AddAssocBetweenUsersOrganizations < ActiveRecord::Migration
  def up
	create_table :organizations_users do |t|
      t.integer :organization_id
	  t.integer :user_id

      t.timestamps
    end
  end

  def down
  end
end
