require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get to index' do
    get root_path
    assert_response :success
  end
end
