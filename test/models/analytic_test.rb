# validates :name, presence: true, length: { minimum: 3, maximum: 50 }
#   validates :number, presence: true, length: { minimum: 3, maximum: 4 }
require "test_helper"
class AnalyticsTest < ActiveSupport::TestCase
  def setup 
    @analytic = Analytic.create(name: "Najemnina za poslovni prostor", number: 4130)
  end

  test "analytic shuld be valid" do
    assert @analytic.valid?    
  end

  test "name should be present" do
    @analytic.name = " "
    assert_not @analytic.valid?
  end
  test "name should not be shorter than 3" do
    @analytic.name = "ab"
    assert_not @analytic.valid?
  end
  test "name should not be longer than 50" do
    @analytic.name = "a"*51
    assert_not @analytic.valid?
  end

  test "number should be present" do
    @analytic.number = nil 
    assert_not @analytic.valid?
  end
  test "number should not be shorter than 3" do
    @analytic.number = 12
    assert_not @analytic.valid?
  end
  test "number should not be longer than 4" do
    @analytic.number = 12345
    assert_not @analytic.valid?
  end
  test "number should not be string" do
    @analytic.number = "ab"
    assert_not @analytic.valid?
  end

end