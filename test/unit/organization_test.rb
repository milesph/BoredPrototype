require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # Start by using Shoulda's ActiveRecord matchers
  # Relationship macros...
  should have_many(:organization_users)
  should have_many(:users).through(:organization_users)
  should have_many(:events)
  
  # Validation macros...
  should validate_presence_of(:name)

end
