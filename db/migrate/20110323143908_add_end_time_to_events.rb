class AddEndTimeToEvents < ActiveRecord::Migration
    def self.up
	add_column :events, :end_time, :datetime
  end

  def self.down
	remove_column :events, :end_time
  end
end
