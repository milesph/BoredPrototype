require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # Start by using Shoulda's ActiveRecord matchers
  # Relationship macros...
  should belong_to(:user)
  should belong_to(:organization)
  
  # Validation macros...
  #should validate_presence_of(:name)
  #should validate_presence_of(:description)
  #should validate_presence_of(:location)
  #should validate_presence_of(:start_time)
  #should validate_presence_of(:end_time)
  
  context "Creating an event for a user" do
  
	  setup do 
		#@jsa = Factory.create(:event)
	  end
	  
	  teardown do
		#@jsa.destroy
	  end
	  
	   should "show that all factories are properly created" do
			#assert_equal @jsa.name, "JSA Awesome Event"
	   
	   end
  
  end
  
  
end
