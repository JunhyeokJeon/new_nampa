require 'test_helper'

class ManualsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manual = manuals(:one)
  end

  test "should get index" do
    get manuals_url
    assert_response :success
  end

  test "should get new" do
    get new_manual_url
    assert_response :success
  end

  test "should create manual" do
    assert_difference('Manual.count') do
      post manuals_url, params: { manual: { age: @manual.age, allergy: @manual.allergy, atopy: @manual.atopy, bb: @manual.bb, color: @manual.color, content: @manual.content, eyebrow: @manual.eyebrow, eyeline: @manual.eyeline, lip: @manual.lip, pimple: @manual.pimple, skincolor: @manual.skincolor, skintype: @manual.skintype, title: @manual.title } }
    end

    assert_redirected_to manual_url(Manual.last)
  end

  test "should show manual" do
    get manual_url(@manual)
    assert_response :success
  end

  test "should get edit" do
    get edit_manual_url(@manual)
    assert_response :success
  end

  test "should update manual" do
    patch manual_url(@manual), params: { manual: { age: @manual.age, allergy: @manual.allergy, atopy: @manual.atopy, bb: @manual.bb, color: @manual.color, content: @manual.content, eyebrow: @manual.eyebrow, eyeline: @manual.eyeline, lip: @manual.lip, pimple: @manual.pimple, skincolor: @manual.skincolor, skintype: @manual.skintype, title: @manual.title } }
    assert_redirected_to manual_url(@manual)
  end

  test "should destroy manual" do
    assert_difference('Manual.count', -1) do
      delete manual_url(@manual)
    end

    assert_redirected_to manuals_url
  end
end
