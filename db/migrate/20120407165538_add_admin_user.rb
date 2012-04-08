class AddAdminUser < ActiveRecord::Migration
  def up
	user = User.new
	user.first_name = 'Joe'
	user.last_name = 'User'
	user.andrew_id = 'admin'
	user.save!
  end

  def down
  end
end
