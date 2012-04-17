class MakeEventApprovedByDefault < ActiveRecord::Migration
  def up
	change_column :events, :approval_rating, :integer, :default => 100
  end

  def down
  end
end
