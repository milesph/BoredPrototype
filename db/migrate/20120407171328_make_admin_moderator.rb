class MakeAdminModerator < ActiveRecord::Migration
  def up
	t = User.find_by_andrew_id('admin')
	t.moderator = true
	t.save!
  end

  def down
  end
end
