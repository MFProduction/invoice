require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @org = Organization.create(name:"Zavod-Bob")
  end

  test "organization sould be valid" do
  	assert @org.valid?
  end

  test "Name sould be present" do
  	@org.name = " "
  	assert_not @org.valid?
  end

  test "name sould not be to short" do
  	@org.name = "ms" 
  	assert_not @org.valid?
  end

test "name sould not be to long" do
    @org.name = "a" * 21
    assert_not @org.valid?
  end
end