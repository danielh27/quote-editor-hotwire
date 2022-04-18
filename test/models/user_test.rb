require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "navbar username" do
    assert_equal "Accountant", users(:accountant).name
  end
end
