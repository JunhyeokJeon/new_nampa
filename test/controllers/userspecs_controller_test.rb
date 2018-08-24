require 'test_helper'

class UserspecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userspec = userspecs(:one)
  end

  test "should get index" do
    get userspecs_url
    assert_response :success
  end

  test "should get new" do
    get new_userspec_url
    assert_response :success
  end

  test "should create userspec" do
    assert_difference('Userspec.count') do
      post userspecs_url, params: { userspec: { age: @userspec.age, allergy: @userspec.allergy, atopy: @userspec.atopy, bb: @userspec.bb, color: @userspec.color, eyebrow: @userspec.eyebrow, eyeline: @userspec.eyeline, lip: @userspec.lip, pimple: @userspec.pimple, skincolor: @userspec.skincolor, skintype: @userspec.skintype } }
    end

    assert_redirected_to userspec_url(Userspec.last)
  end

  test "should show userspec" do
    get userspec_url(@userspec)
    assert_response :success
  end

  test "should get edit" do
    get edit_userspec_url(@userspec)
    assert_response :success
  end

  test "should update userspec" do
    patch userspec_url(@userspec), params: { userspec: { age: @userspec.age, allergy: @userspec.allergy, atopy: @userspec.atopy, bb: @userspec.bb, color: @userspec.color, eyebrow: @userspec.eyebrow, eyeline: @userspec.eyeline, lip: @userspec.lip, pimple: @userspec.pimple, skincolor: @userspec.skincolor, skintype: @userspec.skintype } }
    assert_redirected_to userspec_url(@userspec)
  end

  test "should destroy userspec" do
    assert_difference('Userspec.count', -1) do
      delete userspec_url(@userspec)
    end

    assert_redirected_to userspecs_url
  end
end
