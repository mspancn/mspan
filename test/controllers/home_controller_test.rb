require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success
  end

  test "should get guidance" do
    get home_guidance_url
    assert_response :success
  end

  test "should get terms" do
    get home_terms_url
    assert_response :success
  end

  test "should get teacherhome" do
    get home_teacherhome_url
    assert_response :success
  end

  test "should get teacherfaq" do
    get home_teacherfaq_url
    assert_response :success
  end

end
