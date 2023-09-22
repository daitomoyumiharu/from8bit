require "test_helper"

class MusicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musics_index_url
    assert_response :success
  end
end
