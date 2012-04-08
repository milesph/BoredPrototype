require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Start by using Shoulda's ActiveRecord matchers
  # Relationship macros...
  should have_many(:organization_users)
  should have_many(:organizations).through(:organization_users)
  should have_many(:events)
  
  # Validation macros...
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:andrew_id)

end
