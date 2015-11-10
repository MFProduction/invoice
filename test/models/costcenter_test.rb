  # validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  # validates :number, presence: true, length: { is: 6 }

require "test_helper"
class CostcentersTest < ActiveSupport::TestCase
  def setup 
    @org = Organization.create(name:"testORG")
    @costcenter = @org.costcenters.build(name: "Nedefinirano", number: "005/90")
  end

  test "costcenter shuld be valid" do
    assert @costcenter.valid?    
  end


  test "name should be present" do
    @costcenter.name = " "
    assert_not @costcenter.valid?
  end
  test "name should not be shorter than 3" do
    @costcenter.name = "ab"
    assert_not @costcenter.valid?
  end
  test "name should not be longer than 50" do
    @costcenter.name = "a"*51
    assert_not @costcenter.valid?
  end

  test "number should be present" do
    @costcenter.number = nil 
    assert_not @costcenter.valid?
  end
  test "number must be 6" do
    @costcenter.number = "9876786"
    assert_not @costcenter.valid? 
  end

  test "number should not be string" do
    @costcenter.number = "abcdedf"
    assert_not @costcenter.valid?
  end


end