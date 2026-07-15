require "test_helper"

class HabitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get habit_index_url
    assert_response :success
  end

  test "should get new" do
    get habit_new_url
    assert_response :success
  end

  test "should get edit" do
    get habit_edit_url
    assert_response :success
  end

  test "should get show" do
    get habit_show_url
    assert_response :success
  end
end
